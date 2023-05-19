import 'package:first_mobex_flutter_project/mobx/repository/counter_repository.dart';
import 'package:mobx/mobx.dart';

part 'counter_store.g.dart';

class CounterStore = _CounterStore with _$CounterStore;

abstract class _CounterStore with Store implements CounterRepository {
  @readonly
  int _valueRes = 0;

  @computed
  int get doubleValue => _valueRes * 2;

  @override
  @action
  void incrementCounter() {
    _valueRes++;
  }

  @override
  @action
  void decrementCounter() {
    _valueRes--;
  }

  @override
  int getCounter() {
    // TODO: implement getCounter
    return _valueRes;
  }

  @override
  int getComputedValue() {
    // TODO: implement getCoumputedValue
    return doubleValue;
  }
}
