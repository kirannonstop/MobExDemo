import 'package:first_mobex_flutter_project/mobx/store/school_store/student_store.dart';
import 'package:first_mobex_flutter_project/mobx/store/school_store/teacher_store.dart';
import 'package:first_mobex_flutter_project/network/api_service_abstract_class.dart';
import 'package:first_mobex_flutter_project/pages/animation_builder.dart';
import 'package:first_mobex_flutter_project/pages/my_customscrollview_for_list.dart';
import 'package:first_mobex_flutter_project/pages/school/student_screen.dart';
import 'package:first_mobex_flutter_project/pages/school/teacher_screen.dart';
import 'package:first_mobex_flutter_project/pages/shrink_wrap_list_inside_list.dart';
import 'package:first_mobex_flutter_project/pages/user_list.dart';
import 'package:first_mobex_flutter_project/pages/using_silverlist.dart';
import 'package:flutter/material.dart';

import 'check_performance_by_class.dart';
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
              //  style: TextStyle(inherit: false),
            )),
        ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return ListViewBuilderExample();
              }));
            },
            child: Text(
              "PerformanceCheck",
              //  style: TextStyle(inherit: false),
            )),
        ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return StudentScreen(
                    studentStore: StudentStore(schoolProtocol: StudentImpl()));
              }));
            },
            child: Text(
              "Student",
              //  style: TextStyle(inherit: false),
            )),
        ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return TeacherScreen(
                    teacherStore: TeacherStore(schoolProtocol: TeacherImpl()));
              }));
            },
            child: Text(
              "Teacher",
              // style: TextStyle(inherit: false),
            )),
      ],
    );
  }

  (double, double) getLatitudeAndLongitude(String place) {
    return (0.24324223, 0.3224324);
  }
}
