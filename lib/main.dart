import 'package:flutter/material.dart';
import 'src/modules/initial/page/initial_page.dart'; 
import 'src/home/page/home_page.dart'; 
import 'src/history/page/history_page.dart'; 
import 'src/routes/app_routes.dart';
import 'src/home/controller/address_controller.dart'; 
import 'src/history/controller/history_controller.dart';
import 'src/home/services/address_service.dart';
import 'src/home/repositories/local_storage_repository.dart';
import 'src/home/repositories/address_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Instanciar os repositórios e serviços
    final localStorageRepository = LocalStorageRepository();
    final addressRepository = AddressRepository();
    final addressService = AddressService(
      addressRepository: addressRepository,
      localStorageRepository: localStorageRepository,
    );
    
    // Instanciar os controladores com as dependências necessárias
    final homeController = AddressController(addressService);
    final historyController = HistoryController(localStorageRepository);

    return MaterialApp(
      title: 'FastDelivery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRoutes.initial,
      routes: {
        AppRoutes.initial: (context) => InitialPage(), 
        AppRoutes.home: (context) => HomePage(controller: homeController), 
        AppRoutes.history: (context) => HistoryPage(controller: historyController),
      },
    );
  }
}
