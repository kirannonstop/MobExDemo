import 'package:first_mobex_flutter_project/mobx/store/counter_store/counter_store.dart';
import 'package:first_mobex_flutter_project/mobx/store/user_store.dart';
import 'package:first_mobex_flutter_project/pages/counter_example.dart';
import 'package:first_mobex_flutter_project/pages/some_poc.dart';
import 'package:first_mobex_flutter_project/pages/timer/stopwatch_demo.dart';
import 'package:first_mobex_flutter_project/pages/user_list.dart';
import 'package:flutter/material.dart';

import '../network/api_service_abstract_class_impl.dart';

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
            text: "Counter Example",
          ),
          Tab(
            text: "Timer Demo",
          ),
          Tab(
            text: "Some POC",
          ),
        ]),
      ),
      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          children: [
            UserList(
              userStore: UserStore(ApiServiceAbstractClassImpl()),
              //userStore: UserStore(MockServiceAbstractClassImpl()),
            ),
            //PostList(postStore : PostStore(ApiServiceAbstractClassImpl())),
            CounterExample(
              counterRepository: CounterStore(),
            ),
            StopWatchTimerPage(),
            SomePOC(),
          ],
        ),
      ),
    );
  }
}
