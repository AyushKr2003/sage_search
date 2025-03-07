import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sage_search/services/web_socket_service.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../theme/colors.dart';

class GeminiAnsSection extends StatefulWidget {
  const GeminiAnsSection({super.key});

  @override
  State<GeminiAnsSection> createState() => _GeminiAnsSectionState();
}

class _GeminiAnsSectionState extends State<GeminiAnsSection> {
  bool isLoading = true;
  String fullResponse =
      '''As of the end of Day 1 in the fourth Test match between India and Australia, the score stands at **Australia 311/6**. The match is being held at the Melbourne Cricket Ground (MCG) on December 26, 2024.

## Match Overview
- **Toss**: Australia won the toss and opted to bat first.
- **Top Performers**:
  - **Steve Smith** is currently unbeaten on **68 runs** from **111 balls**.
  - **Sam Konstas**, making his Test debut, scored a significant **60 runs** from **65 balls**, contributing to a strong start for Australia.
  - Other notable contributions include Usman Khawaja and Marnus Labuschagne, both adding valuable runs to the total.

## Session Highlights
- In the first session, Australia reached **112 runs for the loss of one wicket**, with Konstas and Khawaja building an impressive opening partnership of **89 runs** before Konstas was dismissed by Ravindra Jadeja.
- After lunch, Australia maintained their momentum but faced a collapse as Jasprit Bumrah struck back, taking crucial wickets that brought India back into contention. Australia went from a strong position of **223/2** to **263/5** at one point, losing three wickets for just nine runs.

## Bowling Performance
- Indian bowlers had mixed success throughout the day. While Bumrah was effective in the latter stages, picking up key wickets, Jadeja also contributed by taking the first wicket of Konstas.
- Other bowlers like Akash Deep and Washington Sundar chipped in with one wicket each, helping to restrict Australia's scoring after a dominant start.

## Current Situation
As play concluded for the day, Australia stood at **311/6**, with Steve Smith holding firm as India looks to capitalize on their late breakthroughs on Day 2. The match remains finely balanced, with both teams having opportunities to seize control as they progress through this critical Test match in the Border-Gavaskar Trophy series[1][2][3][5].
''';

  @override
  void initState() {
    super.initState();
    ChatWebSocket().contentStream.listen((data) {
      if (isLoading) {
        fullResponse = "";
      }
      setState(() {
        fullResponse += data['data'];
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Sage Search",
          style: GoogleFonts.ibmPlexSans(
            fontSize: 18,
            fontStyle: FontStyle.italic,
          ),
        ),
        Skeletonizer(
          enabled: isLoading,
          child: Markdown(
            data: fullResponse,
            shrinkWrap: true,
            styleSheet:
                MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
              codeblockDecoration: BoxDecoration(
                color: MyColors.searchBar,
                borderRadius: BorderRadius.circular(10),
              ),
              code: const TextStyle(fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}
