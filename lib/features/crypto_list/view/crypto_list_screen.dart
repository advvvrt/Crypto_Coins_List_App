import 'package:flutter/material.dart';
import 'package:gosuslugi/features/crypto_list/widgets/crytpo_coin_tile.dart';

class cryptoListScreen extends StatefulWidget {
  const cryptoListScreen({super.key});

  @override
  State<cryptoListScreen> createState() => _cryptoListScreenState();
}

class _cryptoListScreenState extends State<cryptoListScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('Crypto App'), centerTitle: true),
      body: ListView.separated(
          itemCount: 20,
          separatorBuilder: (context, index) => Divider(),
          itemBuilder:
              (context, i) {
            const serviceName = 'Bitcoin';
            return const CryptoCoinTile(serviceName: serviceName);
          }
      ),
    );
  }
}

