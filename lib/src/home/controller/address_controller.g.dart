// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddressController on _AddressController, Store {
  late final _$addressAtom =
      Atom(name: '_AddressController.address', context: context);

  @override
  AddressModel? get address {
    _$addressAtom.reportRead();
    return super.address;
  }

  @override
  set address(AddressModel? value) {
    _$addressAtom.reportWrite(value, super.address, () {
      super.address = value;
    });
  }

  late final _$historicalAddressesAtom =
      Atom(name: '_AddressController.historicalAddresses', context: context);

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

  late final _$fetchAddressAsyncAction =
      AsyncAction('_AddressController.fetchAddress', context: context);

  @override
  Future<void> fetchAddress(String cep) {
    return _$fetchAddressAsyncAction.run(() => super.fetchAddress(cep));
  }

  late final _$fetchHistoricalAddressesAsyncAction = AsyncAction(
      '_AddressController.fetchHistoricalAddresses',
      context: context);

  @override
  Future<void> fetchHistoricalAddresses() {
    return _$fetchHistoricalAddressesAsyncAction
        .run(() => super.fetchHistoricalAddresses());
  }

  @override
  String toString() {
    return '''
address: ${address},
historicalAddresses: ${historicalAddresses}
    ''';
  }
}
