// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TimerStore on _TimerStore, Store {
  late final _$durationAtom =
      Atom(name: '_TimerStore.duration', context: context);

  @override
  Duration get duration {
    _$durationAtom.reportRead();
    return super.duration;
  }

  @override
  set duration(Duration value) {
    _$durationAtom.reportWrite(value, super.duration, () {
      super.duration = value;
    });
  }

  late final _$timerAtom = Atom(name: '_TimerStore.timer', context: context);

  @override
  Timer? get timer {
    _$timerAtom.reportRead();
    return super.timer;
  }

  @override
  set timer(Timer? value) {
    _$timerAtom.reportWrite(value, super.timer, () {
      super.timer = value;
    });
  }

  late final _$countDownAtom =
      Atom(name: '_TimerStore.countDown', context: context);

  @override
  bool get countDown {
    _$countDownAtom.reportRead();
    return super.countDown;
  }

  @override
  set countDown(bool value) {
    _$countDownAtom.reportWrite(value, super.countDown, () {
      super.countDown = value;
    });
  }

  late final _$_TimerStoreActionController =
      ActionController(name: '_TimerStore', context: context);

  @override
  void reset() {
    final _$actionInfo =
        _$_TimerStoreActionController.startAction(name: '_TimerStore.reset');
    try {
      return super.reset();
    } finally {
      _$_TimerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void startTimer() {
    final _$actionInfo = _$_TimerStoreActionController.startAction(
        name: '_TimerStore.startTimer');
    try {
      return super.startTimer();
    } finally {
      _$_TimerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stopTimer({bool resets = true}) {
    final _$actionInfo = _$_TimerStoreActionController.startAction(
        name: '_TimerStore.stopTimer');
    try {
      return super.stopTimer(resets: resets);
    } finally {
      _$_TimerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
duration: ${duration},
timer: ${timer},
countDown: ${countDown}
    ''';
  }
}
