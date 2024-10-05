import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/address_model.dart';

class AddressRepository {
  Future<AddressModel> fetchAddress(String cep) async {
    final response = await http.get(Uri.parse('https://viacep.com.br/ws/$cep/json/'));

    if (response.statusCode == 200) {
      return AddressModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load address');
    }
  }
}
