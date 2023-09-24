import 'package:flutter/material.dart';
import 'package:flutter_application/pages/cadastro.dart';
import 'package:flutter_application/pages/inicio.dart';
import 'package:flutter_application/pages/login.dart';
import 'package:flutter_application/pages/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/inicio',
      routes: {
        '/splash': (context) => const Splash(),
        '/login': (context) => const Login(),
        '/cadastro': (context) => const Cadastro(),
        '/inicio': (context) => const Inicio(),
      },
    );
  }
}
