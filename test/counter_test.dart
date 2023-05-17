import 'package:first_mobex_flutter_project/mobx/store/counter_store/counter_store.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Counter MobX", () {
    test("Counter value should be start at 0", () {
      expect(CounterStore().valueRes, 0);
    });
    test("Counter Value should be incremented", () {
      final CounterStore counter = CounterStore();
      counter.incrementCounter();
      expect(counter.valueRes, 1);
    });
    test("Counter Value should be decremented", () {
      final CounterStore counter = CounterStore();
      counter.decrementCounter();
      expect(counter.valueRes, -1);
    });
  });
}
