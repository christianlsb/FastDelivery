import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageRepository {
  Future<void> saveAddress(String cep) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> addresses = prefs.getStringList('addresses') ?? [];
    addresses.add(cep);
    await prefs.setStringList('addresses', addresses);
  }

  Future<List<String>> getAddresses() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('addresses') ?? [];
  }
}
