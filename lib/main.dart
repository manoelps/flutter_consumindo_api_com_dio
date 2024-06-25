import 'package:flutter/material.dart';
import 'package:flutter_consumindo_api_com_dio/src/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.red),
      home: const HomePage(),
      debugShowCheckedModeBanner: false, //! oculta banner de debug
    );
  }
}
