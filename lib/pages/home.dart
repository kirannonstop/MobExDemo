import 'package:first_mobex_flutter_project/pages/counter_example.dart';
import 'package:first_mobex_flutter_project/pages/post_list.dart';
import 'package:first_mobex_flutter_project/pages/timer/stopwatch_demo.dart';
import 'package:first_mobex_flutter_project/pages/user_list.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MobX API POC"),
        bottom: TabBar(controller: _tabController, tabs: <Widget>[
          Tab(
            text: "Users",
          ),
          Tab(
            text: "Posts",
          ),
          Tab(
            text: "Counter Example",
          ),
          Tab(
            text: "Timer Demo",
          )
        ]),
      ),
      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          children: [
            UserList(),
            PostList(),
            CounterExample(),
            StopWatchTimerPage(),
          ],
        ),
      ),
    );
  }
}
