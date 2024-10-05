import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../controller/history_controller.dart';

class HistoryPage extends StatefulWidget {
  final HistoryController controller;

  HistoryPage({required this.controller});

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  void initState() {
    super.initState();
    widget.controller.fetchHistoricalAddresses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Histórico de Endereços'),
      ),
      body: Observer(
        builder: (_) {
          if (widget.controller.historicalAddresses.isEmpty) {
            return Center(child: Text('Nenhum endereço encontrado no histórico.'));
          }

          return ListView.builder(
            itemCount: widget.controller.historicalAddresses.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(widget.controller.historicalAddresses[index]),
              );
            },
          );
        },
      ),
    );
  }
}
