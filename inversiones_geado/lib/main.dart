import 'dart:math';

import 'package:flutter/material.dart';
import 'views/home_view.dart';
import 'views/contrato_view.dart';
import 'views/invierte_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeView(),
        '/contrato': (context) => ContratoView(),
        '/invierte': (context) => InvierteView(),
      },
    );
  }
}
