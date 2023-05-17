// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Counter on _Counter, Store {
  Computed<int>? _$doubleValueComputed;

  @override
  int get doubleValue => (_$doubleValueComputed ??=
          Computed<int>(() => super.doubleValue, name: '_Counter.doubleValue'))
      .value;

  late final _$valueResAtom = Atom(name: '_Counter.valueRes', context: context);

  @override
  int get valueRes {
    _$valueResAtom.reportRead();
    return super.valueRes;
  }

  @override
  set valueRes(int value) {
    _$valueResAtom.reportWrite(value, super.valueRes, () {
      super.valueRes = value;
    });
  }

  late final _$_CounterActionController =
      ActionController(name: '_Counter', context: context);

  @override
  void increment() {
    final _$actionInfo =
        _$_CounterActionController.startAction(name: '_Counter.increment');
    try {
      return super.increment();
    } finally {
      _$_CounterActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrement() {
    final _$actionInfo =
        _$_CounterActionController.startAction(name: '_Counter.decrement');
    try {
      return super.decrement();
    } finally {
      _$_CounterActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
valueRes: ${valueRes},
doubleValue: ${doubleValue}
    ''';
  }
}
