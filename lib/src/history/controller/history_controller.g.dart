// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HistoryController on _HistoryController, Store {
  late final _$historicalAddressesAtom =
      Atom(name: '_HistoryController.historicalAddresses', context: context);

  @override
  ObservableList<String> get historicalAddresses {
    _$historicalAddressesAtom.reportRead();
    return super.historicalAddresses;
  }

  @override
  set historicalAddresses(ObservableList<String> value) {
    _$historicalAddressesAtom.reportWrite(value, super.historicalAddresses, () {
      super.historicalAddresses = value;
    });
  }

  late final _$fetchHistoricalAddressesAsyncAction = AsyncAction(
      '_HistoryController.fetchHistoricalAddresses',
      context: context);

  @override
  Future<void> fetchHistoricalAddresses() {
    return _$fetchHistoricalAddressesAsyncAction
        .run(() => super.fetchHistoricalAddresses());
  }

  @override
  String toString() {
    return '''
historicalAddresses: ${historicalAddresses}
    ''';
  }
}
