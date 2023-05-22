import 'dart:math' as math;

import 'package:flutter/material.dart';

class SliversApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ShrinkWrap vs Slivers',
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Revenge of the Slivers"),
        ),
        body: const ShrinkWrapSlivers(),
      ),
    );
  }
}

class ShrinkWrapSlivers extends StatefulWidget {
  const ShrinkWrapSlivers({
    Key? key,
  }) : super(key: key);

  @override
  _ShrinkWrapSliversState createState() => _ShrinkWrapSliversState();
}

class _ShrinkWrapSliversState extends State<ShrinkWrapSlivers> {
  List<SliverList> innerLists = [];
  final numLists = 15;
  final numberOfItemsPerList = 5;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < numLists; i++) {
      final _innerList = <ColorRow>[];
      for (int j = 0; j < numberOfItemsPerList; j++) {
        _innerList.add(ColorRow(
          parentId: i,
        ));
      }
      innerLists.add(
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              print("IN BUILD --> $index");
              return _innerList[index];
            },
            childCount: numberOfItemsPerList,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // width: 100,
        height: 100,
        child: CustomScrollView(slivers: innerLists),
      ),
    );
  }
}

@immutable
class ColorRow extends StatefulWidget {
  int parentId;

  ColorRow({Key? key, required this.parentId}) : super(key: key);

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
    print('Inner Child --> ${widget.parentId}');
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
                  child: Text(
                      'I\'m a widget! --> ${widget.parentId.toString()}',
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
