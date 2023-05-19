import 'package:first_mobex_flutter_project/mobx/repository/counter_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class CounterExample extends StatelessWidget {
  CounterRepository counterRepository; //= CounterStore();

  CounterExample({super.key, required this.counterRepository});

  @override
  Widget build(BuildContext context) {
    print("REBUILD");
    return SingleChildScrollView(
      child: ReactionBuilder(
        builder: (context) {
          /*return autorun(
              (p0) => print("VALUE CHANGED ${counterRepository.getCounter()}"));*/
          /* return reaction((p0) {
            return counterRepository.getCounter();
          }, (p0) {
            print("CHANGED ON THIS REACTION $p0");
          });*/
          return when((p0) {
            return counterRepository.getCounter() == 2;
          }, () {
            print("WHEN CONDITION TRUE ");
          });
        },
        child: Column(
          children: [
            Observer(builder: (_) {
              return Text(
                "Value ${counterRepository.getCounter()} , Computed Value ${counterRepository.getComputedValue()}",
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
      ),
    );
  }
}
