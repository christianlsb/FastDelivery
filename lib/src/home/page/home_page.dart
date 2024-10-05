import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../controller/address_controller.dart';
import '../../routes/app_routes.dart';

class HomePage extends StatelessWidget {
  final AddressController controller;

  HomePage({required this.controller});

  final TextEditingController cepController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buscar Endereço'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Campo para inserção do CEP
            TextField(
              controller: cepController,
              decoration: InputDecoration(
                labelText: 'Digite o CEP',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            // Botão para buscar o endereço
            ElevatedButton(
              onPressed: () async {
                final cep = cepController.text;
                if (cep.isNotEmpty) {
                  await controller.fetchAddress(cep); // Busca o endereço
                  await controller.addressService.localStorageRepository.saveAddress(cep); // Salva o CEP no histórico
                }
              },
              child: Text('Buscar Endereço'),
            ),
            SizedBox(height: 16),
            // Exibição dos dados do endereço
            Observer(
              builder: (_) {
                if (controller.address != null) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Endereço encontrado:', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Rua: ${controller.address?.street ?? 'N/A'}'),
                      Text('Bairro: ${controller.address?.neighborhood ?? 'N/A'}'),
                      Text('Cidade: ${controller.address?.city ?? 'N/A'}'),
                      Text('Estado: ${controller.address?.state ?? 'N/A'}'),
                    ],
                  );
                } else {
                  return Text('Nenhum endereço encontrado.');
                }
              },
            ),
            SizedBox(height: 16),
            // Botão para navegar para a página de histórico
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.history); // Navega para a página de histórico
              },
              child: Text('Ver Histórico de Endereços'),
            ),
          ],
        ),
      ),
    );
  }
}
