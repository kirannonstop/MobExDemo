import 'package:flutter/material.dart';

class ListViewBuilderExample extends StatelessWidget {
  const ListViewBuilderExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("BUILD CALLED");
    return Scaffold(
      appBar: AppBar(title: const Text("ListView.builder")),
      body: ListView.builder(
          itemCount: 5000,
          itemBuilder: (BuildContext context, int index) {
            return const MyWidget();
          }),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    print("BUILD CALLED _MyWidgetState");
    return InkWell(
      onTap: () {
        setState(() {});
      },
      child: const Padding(
        padding: EdgeInsets.all(10),
        child: Text("Hey"),
      ),
    );
    ;
  }
}
