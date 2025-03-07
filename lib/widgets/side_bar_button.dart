import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/colors.dart';

class SideBarButton extends StatelessWidget {
  final bool isColapsed;
  final IconData icon;
  final String text;
  final bool isActive;
  const SideBarButton({
    super.key,
    required this.isColapsed,
    required this.icon,
    required this.text,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
      decoration: isActive
          ? BoxDecoration(
              color: MyColors.searchBar,
              borderRadius: BorderRadius.circular(10),
            )
          : BoxDecoration(),
      child: Row(
        mainAxisAlignment:
            isColapsed ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            child: Icon(
              icon,
              color: MyColors.white70,
              size: 22,
            ),
          ),
          isColapsed
              ? const SizedBox()
              : Text(
                  text,
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ],
      ),
    );
  }
}
