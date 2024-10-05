import 'package:flutter/material.dart';
import 'src/modules/initial/page/initial_page.dart'; 
import 'src/modules/initial/page/home_page.dart'; 
import 'src/routes/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FastDelivery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRoutes.initial,
      routes: {
        AppRoutes.initial: (context) => InitialPage(), 
        AppRoutes.home: (context) => HomePage(), 
      },
    );
  }
}
