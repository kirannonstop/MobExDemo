// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CounterStore on _CounterStore, Store {
  Computed<int>? _$doubleValueComputed;

  @override
  int get doubleValue =>
      (_$doubleValueComputed ??= Computed<int>(() => super.doubleValue,
              name: '_CounterStore.doubleValue'))
          .value;

  late final _$valueResAtom =
      Atom(name: '_CounterStore.valueRes', context: context);

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

  late final _$_CounterStoreActionController =
      ActionController(name: '_CounterStore', context: context);

  @override
  void incrementCounter() {
    final _$actionInfo = _$_CounterStoreActionController.startAction(
        name: '_CounterStore.incrementCounter');
    try {
      return super.incrementCounter();
    } finally {
      _$_CounterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrementCounter() {
    final _$actionInfo = _$_CounterStoreActionController.startAction(
        name: '_CounterStore.decrementCounter');
    try {
      return super.decrementCounter();
    } finally {
      _$_CounterStoreActionController.endAction(_$actionInfo);
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
