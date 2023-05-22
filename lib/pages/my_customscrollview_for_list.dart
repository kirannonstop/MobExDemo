import 'dart:math' as math;

import 'package:flutter/material.dart';

class MyCustomScrollView extends StatefulWidget {
  const MyCustomScrollView({Key? key}) : super(key: key);

  @override
  State<MyCustomScrollView> createState() => _MyCustomScrollViewState();
}

class _MyCustomScrollViewState extends State<MyCustomScrollView> {
  List<int> innerList = [];
  List<String> outerList = ["aaa", "bbb", "ccc", "ddd", "eee", "fff"];

  List<SliverList> innerSliverLists = [];

  //final numberOfItemsPerList = 10;

  //static const String aa = "aaaa";
  //DateTime date = DateTime.timestamp();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var i = 0; i < 10; i++) {
      innerList.add(i);
    }
    /* for (var i = 0; i < 15; i++) {
      outerList.add(innerList);
    }*/
    for (var parentElement in outerList) {
      final widgetList = createInnerWidgetList(parentElement);
      innerSliverLists.add(
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return widgetList[index];
        }, childCount: widgetList.length)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: usingShrinkWrapTrue(),
      body: usingCustomScrollView(),
    );
  }

  Widget usingCustomScrollView() {
    return CustomScrollView(
      slivers: innerSliverLists,
    );
    /* return CustomScrollView(
      slivers:
      [
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Container(
              child: Text(outerList[index]),
            ); //createInnerWidgetList(outerList[index]);
          }, childCount: outerList.length),
        )
      ],
    );*/
  }

  usingShrinkWrapTrue() {
    return ListView.builder(
        // shrinkWrap: true,
        //physics: const NeverScrollableScrollPhysics(),
        itemCount: outerList.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return setInnerList(outerList[index]);
        });
  }

  setInnerList(String indexParents) {
    // return Expanded(
    print("INNERlIST $indexParents");
    return ListView.builder(
        itemCount: innerList.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            color: Colors.red,
            height: 50,
            child: Center(
              child: Text(
                  " $indexParents -- INNER ITEM ${innerList[index].toString()}"),
            ),
          );
        });
    // );
  }

  createInnerWidgetList(String parentElement) {
    List<Widget> widgetList = [];
    for (var i = 0; i < 10; i++) {
      widgetList.add(ColorRow(parentElement: parentElement)
          /*   AnimatedContainer(
           color: Colors.red,
          height: 50,
          duration: Duration(seconds: 1),
          curve: Curves.fastEaseInToSlowEaseOut,
          child: Center(
            child: Text(" $parentElement --> ${i.toString()}"),
          ),
        ),*/
          );
    }
    return widgetList;
  }
}

@immutable
class ColorRow extends StatefulWidget {
  String parentElement;

  ColorRow({Key? key, required this.parentElement}) : super(key: key);

  @override
  State createState() => ColorRowState();
}

class ColorRowState extends State<ColorRow> {
  Color? color;

  @override
  void initState() {
    super.initState();
    color = randomColor();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("USING CUSTOM SCROLLVIEW ${widget.parentElement}");
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            randomColor(),
            randomColor(),
          ],
        ),
      ),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(height: 50, width: 50, color: Colors.white),
          ),
          Flexible(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text('I\'m a widget! ---> ${widget.parentElement}',
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Color randomColor() =>
    Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
