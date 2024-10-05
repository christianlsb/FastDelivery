import 'package:mobx/mobx.dart';
import '../services/address_service.dart';
import '../model/address_model.dart';

part 'address_controller.g.dart';

class AddressController = _AddressController with _$AddressController;

abstract class _AddressController with Store {
  final AddressService addressService;

  _AddressController(this.addressService);

  @observable
  AddressModel? address;

  @observable
  ObservableList<String> historicalAddresses = ObservableList<String>();

  @action
  Future<void> fetchAddress(String cep) async {
    address = await addressService.getAddress(cep);
  }

  @action
  Future<void> fetchHistoricalAddresses() async {
    historicalAddresses.addAll(await addressService.getHistoricalAddresses());
  }
}
