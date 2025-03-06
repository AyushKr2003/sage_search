import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/colors.dart';

class SearchBarButton extends StatefulWidget {
  final IconData icon;
  final String text;
  const SearchBarButton({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  State<SearchBarButton> createState() => _SearchBarButtonState();
}

class _SearchBarButtonState extends State<SearchBarButton> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHovered = false;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 4,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: isHovered ? MyColors.background : Colors.transparent,
        ),
        child: Row(
          children: [
            Icon(
              widget.icon,
              color: MyColors.searchText,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              widget.text,
              style: GoogleFonts.ibmPlexMono(
                color: MyColors.searchText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
