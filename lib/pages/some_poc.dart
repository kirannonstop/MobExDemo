import 'dart:isolate';

import 'package:flutter/material.dart';

class SomePOC extends StatefulWidget {
  const SomePOC({Key? key}) : super(key: key);

  @override
  State<SomePOC> createState() => _SomePOCState();
}

class _SomePOCState extends State<SomePOC> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
        )
      ],
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
