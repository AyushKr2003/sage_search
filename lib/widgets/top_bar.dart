import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/colors.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Row(
        children: [
          Row(
            spacing: 5,
            children: [
              SizedBox(width: 10),
              CircleAvatar(
                backgroundImage: AssetImage('assets/app_icon_bg.png'),
                radius: 30,
                backgroundColor: MyColors.white,
              ),
              Text(
                "SageSearch",
                style: GoogleFonts.manrope(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Spacer(),
          Row(
            children: [
              Image.asset(
                "assets/sliderIcon.png",
                scale: 1,
                width: 40,
              ),
              SizedBox(width: 32),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: MyColors.searchBar,
                ),
                child: Icon(
                  Icons.person,
                  color: MyColors.white,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
