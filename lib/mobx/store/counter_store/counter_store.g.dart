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

  late final _$_valueResAtom =
      Atom(name: '_CounterStore._valueRes', context: context);

  int get valueRes {
    _$_valueResAtom.reportRead();
    return super._valueRes;
  }

  @override
  int get _valueRes => valueRes;

  @override
  set _valueRes(int value) {
    _$_valueResAtom.reportWrite(value, super._valueRes, () {
      super._valueRes = value;
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
doubleValue: ${doubleValue}
    ''';
  }
}
