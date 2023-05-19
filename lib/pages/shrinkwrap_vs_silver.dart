import 'package:first_mobex_flutter_project/pages/my_customscrollview_for_list.dart';
import 'package:first_mobex_flutter_project/pages/shrink_wrap_list_inside_list.dart';
import 'package:flutter/material.dart';

import 'using_silverlist.dart';

class ShrinkWrapVsSilver extends StatelessWidget {
  const ShrinkWrapVsSilver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return ShrinkWrApp();
              }));
            },
            child: Text("Using ShrinkWrap")),
        ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return SliversApp();
              }));
            },
            child: Text("Using SilverList")),
        ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return const MyCustomScrollView();
              }));
            },
            child: Text("My Program using These 2 same")),
      ],
    );
  }
}
