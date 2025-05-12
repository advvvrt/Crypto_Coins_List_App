import 'package:flutter/material.dart';

class cryptoScreen extends StatefulWidget {
  const cryptoScreen({super.key});

  @override
  State<cryptoScreen> createState() => _cryptoScreenState();
}

class _cryptoScreenState extends State<cryptoScreen> {
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