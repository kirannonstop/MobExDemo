import 'dart:isolate';

import 'package:flutter/material.dart';

class SomePOC extends StatefulWidget {
  const SomePOC({Key? key}) : super(key: key);

  @override
  State<SomePOC> createState() => _SomePOCState();
}

class _SomePOCState extends State<SomePOC> {
  List<List<String>> outerList = [
    ["aaa", "bbb", "ccc"],
    []
  ];

  @override
  Widget build(BuildContext context) {
    return MyInheritedWidget(
      sendData: "THIS DATA IS FROM PARENT",
      child: Container(
        child: Column(
          children: [
            CircularProgressIndicator(),
            ElevatedButton(
              onPressed: () {
                //ReceivePort is to listen for the isolate to finish job
                final receivePort = ReceivePort();

                Isolate.spawn(heavyJob, receivePort.sendPort);
                receivePort.listen((sum) {
                  print("SUM --> $sum");
                });
              },
              child: Text("Click"),
            ),
            AnotherChildWidget(),
          ],
        ),
      ),
    );
  }

  static void heavyJob(SendPort sendPort) {
    print("heavy job started");
    List<int> res = [];
    double sum = 0;
    for (var i = 0; i < 100000000; i++) {
      sum = sum + i;
      res.add(i);
    }
    print("heavy job finished");
    sendPort.send(sum);
  }
}

class AnotherChildWidget extends StatelessWidget {
  const AnotherChildWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sendData = MyInheritedWidget.of(context).sendData;
    return Text(
      sendData,
      style:
          Theme.of(context).textTheme.labelSmall?.copyWith(color: Colors.red),
    );
  }
}

class MyInheritedWidget extends InheritedWidget {
  final String sendData;

  MyInheritedWidget({required this.sendData, required Widget child})
      : super(child: child);

  static MyInheritedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>()!;
  }

  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return oldWidget.sendData != sendData;
  }
}
