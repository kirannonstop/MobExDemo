import 'package:first_mobex_flutter_project/mobx/store/counter_store/counter_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CounterExample extends StatefulWidget {
  @override
  State<CounterExample> createState() => _CounterExampleState();
}

class _CounterExampleState extends State<CounterExample> {
  Counter counter = Counter();
  int valueRes = 0;

  @override
  Widget build(BuildContext context) {
    print("REBUILD");
    return SingleChildScrollView(
      child: Column(
        children: [
          Observer(builder: (_) {
            return Text("VALUE ${counter.valueRes}");
          }),
          const SizedBox(
            height: 20,
          ),
          Text("COMPUTED VALUE --> ${counter.doubleValue}"),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              counter.increment();
            },
            child: Text("INCREMENT VALUE"),
          ),
          const SizedBox(
            height: 20,
          ),
          Text("FROM THIS VIEW $valueRes"),
          ElevatedButton(
            onPressed: () {
              setState(() {
                this.valueRes++;
              });
            },
            child: Text("INCREMENT ON THIS PAGE"),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
