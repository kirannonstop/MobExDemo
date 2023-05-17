import 'package:first_mobex_flutter_project/mobx/repository/counter_repository.dart';
import 'package:first_mobex_flutter_project/mobx/store/counter_store/counter_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CounterExample extends StatelessWidget {
  CounterRepository counterRepository = CounterStore();
  int valueRes = 0;

  @override
  Widget build(BuildContext context) {
    print("REBUILD");
    return SingleChildScrollView(
      child: Column(
        children: [
          Observer(builder: (_) {
            return Text(
              "Value ${counterRepository.getCounter()} , Computed Value ${counterRepository.getCoumputedValue()}",
              style: TextStyle(fontSize: 20),
            );
          }),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              counterRepository.incrementCounter();
            },
            child: Text("INCREMENT VALUE"),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              counterRepository.decrementCounter();
            },
            child: Text("DECREMENT VALUE"),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
