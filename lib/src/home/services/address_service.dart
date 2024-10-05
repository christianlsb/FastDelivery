import '../repositories/address_repository.dart';
import '../repositories/local_storage_repository.dart';
import '../model/address_model.dart';

class AddressService {
  final AddressRepository addressRepository;
  final LocalStorageRepository localStorageRepository;

  AddressService({
    required this.addressRepository,
    required this.localStorageRepository,
  });

  Future<AddressModel> getAddress(String cep) async {
    final address = await addressRepository.fetchAddress(cep);
    await localStorageRepository.saveAddress(address.cep);
    return address;
  }

  Future<List<String>> getHistoricalAddresses() async {
    return await localStorageRepository.getAddresses();
  }
}
