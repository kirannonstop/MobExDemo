import 'package:first_mobex_flutter_project/pages/animation_builder.dart';
import 'package:first_mobex_flutter_project/pages/my_customscrollview_for_list.dart';
import 'package:first_mobex_flutter_project/pages/shrink_wrap_list_inside_list.dart';
import 'package:first_mobex_flutter_project/pages/user_list.dart';
import 'package:first_mobex_flutter_project/pages/using_silverlist.dart';
import 'package:flutter/material.dart';

import 'do_the_memory_leak.dart';

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
        ElevatedButton(
            onPressed: () {
              var (lat, long) = getLatitudeAndLongitude("Nashik");
              print("LAT --> $lat");
              print("LONG --> $long");
            },
            child: Text("2 return values")),
        ElevatedButton(
            onPressed: () {
              MemoryLeaksScreen();
            },
            child: Text(
                "Do the Memory Leak ---> ${DateTime.now().getTodaysDay()}")),
        ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return AnimationExample();
              }));
            },
            child: Text(
              "Animation Example",
              style: TextStyle(inherit: false),
            )),
      ],
    );
  }

  (double, double) getLatitudeAndLongitude(String place) {
    return (0.24324223, 0.3224324);
  }
}
