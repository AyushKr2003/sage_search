import 'package:flutter/material.dart';
import '../services/web_socket_service.dart';

import '../constant/const.dart';
import '../widgets/custome_list.dart';
import '../widgets/search_section.dart';
import '../widgets/side_bar.dart';
import '../widgets/top_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    ChatWebSocket().connect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TopBar(),
          Expanded(
            child: Row(
              children: [
                SideBar(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SearchSection(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomeList(
                              listItems: suggestions,
                              title: "Suggested",
                            ),
                            SizedBox(height: 10),
                            CustomeList(
                              listItems: recent,
                              title: "Recent Searches",
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
