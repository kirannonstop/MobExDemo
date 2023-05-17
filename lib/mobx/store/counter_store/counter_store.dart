import 'package:mobx/mobx.dart';

part 'counter_store.g.dart';

class Counter = _Counter with _$Counter;

abstract class _Counter with Store {
  @observable
  int valueRes = 0;

  @computed
  int get doubleValue => valueRes * 2;

  @action
  void increment() {
    valueRes++;
  }

  @action
  void decrement() {
    valueRes--;
  }
}
