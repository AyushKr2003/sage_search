import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/colors.dart';
import '../widgets/side_bar_button.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  bool isColapsed = false;

  void _handleScreenResize() {
    setState(() {
      isColapsed = MediaQuery.of(context).size.width <= 900;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _handleScreenResize();
    });
    // Add listener for window size changes
    WidgetsBinding.instance
        .addObserver(_WindowSizeObserver(onResize: _handleScreenResize));
  }

  @override
  void dispose() {
    // Remove the observer when widget is disposed
    WidgetsBinding.instance
        .removeObserver(_WindowSizeObserver(onResize: _handleScreenResize));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: EdgeInsets.only(left: 10),
      duration: const Duration(milliseconds: 300),
      width: isColapsed ? 64 : 250,
      color: MyColors.background,
      child: Column(
        children: [
          const SizedBox(height: 2),
          Column(
            crossAxisAlignment: isColapsed
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 4,
              ),
              SideBarButton(
                isColapsed: isColapsed,
                icon: Icons.home,
                text: "Home",
                isActive: true,
              ),
              SideBarButton(
                isColapsed: isColapsed,
                icon: Icons.explore_outlined,
                text: "Explore",
              ),
              SideBarButton(
                isColapsed: isColapsed,
                icon: Icons.bookmark_outline,
                text: "Saved",
              ),
              SideBarButton(
                isColapsed: isColapsed,
                icon: Icons.settings_outlined,
                text: "Settings",
              ),
              SideBarButton(
                isColapsed: isColapsed,
                icon: Icons.chat_bubble_outline,
                text: "Feedback",
              ),
            ],
          ),
          const Spacer(),
          RawMaterialButton(
            onPressed: () {
              setState(() {
                isColapsed = !isColapsed;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    isColapsed
                        ? Icons.keyboard_arrow_right
                        : Icons.keyboard_arrow_left,
                    color: MyColors.white,
                    size: 22,
                  ),
                  if (!isColapsed)
                    Text(
                      'Collapse',
                      style: GoogleFonts.ibmPlexMono(
                        color: MyColors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _WindowSizeObserver extends WidgetsBindingObserver {
  final VoidCallback onResize;

  _WindowSizeObserver({required this.onResize});

  @override
  void didChangeMetrics() {
    onResize();
  }
}
