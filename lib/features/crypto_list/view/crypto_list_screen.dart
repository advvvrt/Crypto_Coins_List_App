import 'package:flutter/material.dart';
import 'package:gosuslugi/features/crypto_list/widgets/crytpo_coin_tile.dart';
import 'package:gosuslugi/repositories/crypto_coins/crypto_coins_repository.dart';
import 'package:gosuslugi/repositories/crypto_coins/models/crypto_coin.dart';

class cryptoListScreen extends StatefulWidget {
  const cryptoListScreen({super.key});

  @override
  State<cryptoListScreen> createState() => _cryptoListScreenState();
}

class _cryptoListScreenState extends State<cryptoListScreen> {
  List<CryptoCoin>? _cryptoCoinsList;

  @override
  void initState() {
    _loadCryptoCoins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Crypto App'), centerTitle: true),
      body:
          (_cryptoCoinsList == null)
              ? const Center(child: CircularProgressIndicator())
              : ListView.separated(
                padding: EdgeInsets.only(top: 16),
                itemCount: _cryptoCoinsList!.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, i) {
                  final coin = _cryptoCoinsList![i];
                  return CryptoCoinTile(Coin: coin);
                },
              ),
    );
  }

  Future<void> _loadCryptoCoins() async {
    _cryptoCoinsList = await Crypto_coins_repository().getCoinsList();
    setState(() {});
  }
}
