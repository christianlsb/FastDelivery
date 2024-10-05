import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../controller/history_controller.dart';

class HistoryPage extends StatelessWidget {
  final HistoryController controller;

  HistoryPage({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Histórico de Endereços'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Observer(
          builder: (_) {
            if (controller.historicalAddresses.isEmpty) {
              return Text('Nenhum endereço consultado ainda.');
            } else {
              return ListView.builder(
                itemCount: controller.historicalAddresses.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(controller.historicalAddresses[index]),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
