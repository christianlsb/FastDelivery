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
        title: Text('Buscar Endereço', style: TextStyle(fontSize: 22)),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Insira o CEP para buscar o endereço:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              TextField(
                controller: cepController,
                decoration: InputDecoration(
                  labelText: 'Digite o CEP',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Ex: 12345-678',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () async {
                  final cep = cepController.text;
                  if (cep.isNotEmpty) {
                    await controller.fetchAddress(cep);
                  }
                },
                child: Text('Buscar Endereço', style: TextStyle(fontSize: 16)),
              ),
              SizedBox(height: 16),
              Observer(
                builder: (_) {
                  if (controller.address != null) {
                    return Card(
                      elevation: 6,
                      margin: EdgeInsets.only(top: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Endereço encontrado:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.blueAccent,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text('Rua: ${controller.address?.street ?? 'N/A'}'),
                            Text('Bairro: ${controller.address?.neighborhood ?? 'N/A'}'),
                            Text('Cidade: ${controller.address?.city ?? 'N/A'}'),
                            Text('Estado: ${controller.address?.state ?? 'N/A'}'),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Text(
                        'Nenhum endereço encontrado.',
                        style: TextStyle(color: Colors.redAccent),
                      ),
                    );
                  }
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[800],
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.history);
                },
                child: Text('Ver Histórico de Endereços', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
