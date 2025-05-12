import 'package:flutter/material.dart';
import 'package:gosuslugi/router/router.dart';
import 'package:gosuslugi/theme/theme.dart';



class cryptoApp extends StatelessWidget {
  const cryptoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto App',
      theme: darktheme,
      routes: routes,
    );
  }
}