import 'package:flutter/material.dart';

class MyCustomScrollView extends StatefulWidget {
  const MyCustomScrollView({Key? key}) : super(key: key);

  @override
  State<MyCustomScrollView> createState() => _MyCustomScrollViewState();
}

class _MyCustomScrollViewState extends State<MyCustomScrollView> {
  List<int> innerList = [];
  List<List<int>> outerList = [];

  //static const String aa = "aaaa";
  //DateTime date = DateTime.timestamp();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var i = 0; i < 20; i++) {
      innerList.add(i);
    }
    for (var i = 0; i < 15; i++) {
      outerList.add(innerList);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // const Text(aa),
          //Text(date.toString())
          //usingCustomSilverScrollView(),
        ],
      ),
    );
  }

  usingShrinkWrapTrue() {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: outerList.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.purple,
            child: Column(
              children: [
                Text(outerList[index].toString()),
                const SizedBox(
                  height: 10,
                ),
                setInnerList()
              ],
            ),
          );
        });
  }

  setInnerList() {
    return Expanded(
      child: ListView.builder(
          itemCount: innerList.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              color: Colors.red,
              height: 50,
              child: Center(
                child: Text("INNER ITEM ${innerList[index].toString()}"),
              ),
            );
          }),
    );
  }
}
