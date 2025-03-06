import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/colors.dart';
import 'search_bar_button.dart';

class SearchSection extends StatefulWidget {
  const SearchSection({super.key});

  @override
  State<SearchSection> createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "What do you want to know?",
            style: GoogleFonts.ibmPlexMono(
              fontSize: 36,
              fontWeight: FontWeight.w500,
              height: 1.2,
              letterSpacing: -0.8,
              color: MyColors.white.withValues(alpha: 0.9),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "Start with a detailed question - search for anything from quantum physics to pop culture",
            style: GoogleFonts.ibmPlexMono(
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: MyColors.white.withValues(alpha: 0.5),
            ),
          ),
          const SizedBox(height: 40),
          Container(
            decoration: BoxDecoration(
              color: MyColors.searchBar,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: searchController,
                    style: GoogleFonts.ibmPlexMono(
                      color: AppColors.textGrey,
                      fontSize: 16,
                    ),
                    decoration: InputDecoration(
                      hintText: "Describe what you're looking for...",
                      hintStyle: GoogleFonts.ibmPlexMono(
                        color: MyColors.searchText,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                      border: InputBorder.none,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Icon(
                          Icons.search_rounded,
                          color: MyColors.searchText,
                          size: 24,
                        ),
                      ),
                      prefixIconConstraints: const BoxConstraints(
                        minWidth: 40,
                        minHeight: 40,
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
                Divider(
                  height: 1,
                  color: AppColors.searchBarBorder.withValues(alpha: 0.4),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SearchBarButton(
                        icon: Icons.auto_awesome_outlined,
                        text: 'Focus',
                      ),
                      const SizedBox(width: 12),
                      SearchBarButton(
                        icon: Icons.add_circle_outline_outlined,
                        text: 'Attach',
                      ),
                      Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF1FB9CE),
                              Color(0xFF1A8CF0),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                          ),
                          child: Row(
                            children: [
                              Text(
                                "Search",
                                style: GoogleFonts.ibmPlexMono(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(width: 12),
                              const Icon(Icons.arrow_forward_rounded, size: 16),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
