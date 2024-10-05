import 'package:flutter/material.dart';

class AddressListComponent extends StatelessWidget {
  final List<String> addresses;

  AddressListComponent({required this.addresses});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: addresses.length,
      itemBuilder: (context, index) {
        return ListTile(title: Text(addresses[index]));
      },
    );
  }
}



