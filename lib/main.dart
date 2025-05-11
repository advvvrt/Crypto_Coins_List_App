import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const gosuslugiApp());
}

class gosuslugiApp extends StatelessWidget {
  const gosuslugiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gosuslugi App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        primarySwatch: Colors.blue,
        dividerColor: Colors.white24,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        listTileTheme: const ListTileThemeData(iconColor: Colors.white),
        textTheme: TextTheme(
          bodyMedium: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 24,
          ),
          labelSmall: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
      ),
      routes: {
        '/': (context) => gosuslugiListScreen(),
        '/medical': (context) => medicalScreen(),
      },
    );
  }
}

class gosuslugiListScreen extends StatefulWidget {
  const gosuslugiListScreen({super.key});

  @override
  State<gosuslugiListScreen> createState() => _gosuslugiListScreenState();
}

class _gosuslugiListScreenState extends State<gosuslugiListScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Gosuslugi App'), centerTitle: true),
      body: ListView.separated(
        itemCount: 20,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder:
            (context, i) {
          const serviceName = 'Запись к педиатору';
              return ListTile(
                leading: Image.asset(
                  'assets/image/Doctor.png',
                  height: 50,
                  width: 50,
                ),
                title: Text(
                  serviceName,
                  style: theme.textTheme.bodyMedium,
                ),
                subtitle: Text('100р', style: theme.textTheme.labelSmall),
                trailing: const Icon(Icons.arrow_circle_right),
                onTap: () {
                  Navigator.of(context).pushNamed('/medical',
                    arguments: serviceName,
                  );
                },
              );
            }
      ),
    );
  }
}

class medicalScreen extends StatefulWidget {
  const medicalScreen({super.key});

  @override
  State<medicalScreen> createState() => _medicalScreenState();
}

class _medicalScreenState extends State<medicalScreen> {
  String? medicalName;


  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is String, 'You must provide string args');
    medicalName = args as String;
    setState(() {});
    super.didChangeDependencies();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(medicalName ?? '...')),
    );
  }
}
