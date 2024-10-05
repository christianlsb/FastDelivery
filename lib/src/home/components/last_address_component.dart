import 'package:flutter/material.dart';

class LastAddressComponent extends StatelessWidget {
  final String lastAddress;

  LastAddressComponent({required this.lastAddress});

  @override
  Widget build(BuildContext context) {
    return Text('Último Endereço: $lastAddress');
  }
}