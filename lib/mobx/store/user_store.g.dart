// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserStore on _UserStore, Store {
  Computed<User?>? _$lastComputedUserComputed;

  @override
  User? get lastComputedUser => (_$lastComputedUserComputed ??= Computed<User?>(
          () => super.lastComputedUser,
          name: '_UserStore.lastComputedUser'))
      .value;

  late final _$userListFutureAtom =
      Atom(name: '_UserStore.userListFuture', context: context);

  @override
  ObservableFuture<List<User>>? get userListFuture {
    _$userListFutureAtom.reportRead();
    return super.userListFuture;
  }

  @override
  set userListFuture(ObservableFuture<List<User>>? value) {
    _$userListFutureAtom.reportWrite(value, super.userListFuture, () {
      super.userListFuture = value;
    });
  }

  late final _$_UserStoreActionController =
      ActionController(name: '_UserStore', context: context);

  @override
  dynamic fetchUsers() {
    final _$actionInfo =
        _$_UserStoreActionController.startAction(name: '_UserStore.fetchUsers');
    try {
      return super.fetchUsers();
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userListFuture: ${userListFuture},
lastComputedUser: ${lastComputedUser}
    ''';
  }
}
