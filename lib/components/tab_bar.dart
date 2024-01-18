import 'package:flutter/material.dart';
import '../utils/text_style.dart';

class TabBarEd extends StatelessWidget {
   TabBarEd({super.key});

  @override
  Widget build(BuildContext context) {
    return
    TabBar(
      labelColor: Colors.white,
      labelStyle: AppTextStyle.barText,
      dividerHeight: 0,
      indicatorSize: TabBarIndicatorSize.tab,
      unselectedLabelColor: Colors.grey,
      indicatorColor: Colors.blue,
      tabs: [
        Tab(
          text: 'Tasks',
        ),
        Tab(
          text: 'Done',
        ),
        Tab(
          text: 'Archive',
        ),
      ],
    );
  }
}
