import 'dart:async';

import 'package:mobx/mobx.dart';

part 'timer_store.g.dart';

class TimerStore = _TimerStore with _$TimerStore;

abstract class _TimerStore with Store {
  static const countdownDuration = Duration(minutes: 10);
  @observable
  Duration duration = Duration();

  @observable
  Timer? timer;

  @observable
  bool countDown = true;

  @action
  void reset() {
    if (countDown) {
      duration = countdownDuration;
    } else {
      duration = Duration();
    }
  }

  @action
  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      final addSeconds = countDown ? -1 : 1;

      final seconds = duration.inSeconds + addSeconds;
      if (seconds < 0) {
        timer?.cancel();
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  @action
  void stopTimer({bool resets = true}) {
    if (resets) {
      reset();
    }
    timer?.cancel();
  }
}
