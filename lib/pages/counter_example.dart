import 'package:first_mobex_flutter_project/mobx/repository/counter_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import 'hero_animation_demo.dart';

class CounterExample extends StatefulWidget {
  CounterRepository counterRepository; //= CounterStore();

  CounterExample({super.key, required this.counterRepository});

  @override
  State<CounterExample> createState() => _CounterExampleState();
}

class _CounterExampleState extends State<CounterExample> {
  int localCounter = 0;

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
            return widget.counterRepository.getCounter() == 2;
          }, () {
            print("WHEN CONDITION TRUE ");
          });
        },
        child: Column(
          children: [
            Observer(builder: (_) {
              return Text(
                "Value ${widget.counterRepository.getCounter()} , Computed Value ${widget.counterRepository.getComputedValue()}",
                style: TextStyle(fontSize: 20),
              );
            }),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                widget.counterRepository.incrementCounter();
              },
              child: Text("INCREMENT VALUE"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                widget.counterRepository.decrementCounter();
              },
              child: Text("DECREMENT VALUE"),
            ),
            const SizedBox(
              height: 20,
            ),
            Text("USING SETSTATE $localCounter"),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  localCounter++;
                });
              },
              child: Text("USING SETSTATE"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return LogoWidgetUsingHero();
                }));
              },
              child: Text(
                "Hero Animation Example",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
