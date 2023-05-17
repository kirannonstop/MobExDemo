import 'package:first_mobex_flutter_project/mobx/repository/counter_repository.dart';
import 'package:mobx/mobx.dart';

part 'counter_store.g.dart';

class CounterStore = _CounterStore with _$CounterStore;

abstract class _CounterStore with Store implements CounterRepository {
  @observable
  int valueRes = 0;

  @computed
  int get doubleValue => valueRes * 2;

  @override
  @action
  void incrementCounter() {
    valueRes++;
  }

  @override
  @action
  void decrementCounter() {
    valueRes--;
  }

  @override
  int getCounter() {
    // TODO: implement getCounter
    return valueRes;
  }

  @override
  int getCoumputedValue() {
    // TODO: implement getCoumputedValue
    return doubleValue;
  }
}
