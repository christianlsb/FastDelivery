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
        title: Text(
          'Histórico de Endereços',
          style: TextStyle(fontSize: 22),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Observer(
        builder: (_) {
          if (widget.controller.historicalAddresses.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Nenhum endereço encontrado no histórico.',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: widget.controller.historicalAddresses.length,
            itemBuilder: (context, index) {
              final address = widget.controller.historicalAddresses[index];
              return Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Icon(Icons.history, color: Colors.blueAccent),
                      SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          address,
                          style: TextStyle(fontSize: 16),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
