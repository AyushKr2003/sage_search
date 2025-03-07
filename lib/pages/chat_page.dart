// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:sage_search/theme/colors.dart';
import 'package:sage_search/widgets/gemini_ans_section.dart';

import 'package:sage_search/widgets/side_bar.dart';
import 'package:sage_search/widgets/sources_section.dart';

import '../widgets/top_bar.dart';

class ChatPage extends StatelessWidget {
  final String question;
  const ChatPage({
    super.key,
    required this.question,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TopBar(),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SideBar(),
                SizedBox(width: 50),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          question,
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        //Source Sction
                        SourcesSection(),
                        SizedBox(height: 20),
                        //gemini result
                        GeminiAnsSection(),
                      ],
                    ),
                  ),
                ),
                Placeholder(
                  strokeWidth: 0,
                  color: MyColors.background,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
