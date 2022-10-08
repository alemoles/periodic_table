import 'package:flutter/material.dart';
import 'package:periodic_table/src/pages/tabla_periodica.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tabla periodica',
      home: Scaffold(
        body: Center(
          child: TablaPeriodicaPage(),
        ),
      ),
    );
  }
}
