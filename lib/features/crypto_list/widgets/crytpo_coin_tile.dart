import 'package:flutter/material.dart';
import 'package:gosuslugi/repositories/crypto_coins/models/crypto_coin.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({
    super.key,
    required this.Coin,
  });

  final CryptoCoin Coin;


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: Image.network(Coin.imageUrl),
      title: Text(
        Coin.Name,
        style: theme.textTheme.bodyMedium,
      ),
      subtitle: Text('${Coin.priceInUSD} \$', style: theme.textTheme.labelSmall),
      trailing: const Icon(Icons.arrow_circle_right),
      onTap: () {
        Navigator.of(context).pushNamed('/medical',
          arguments: Coin,
        );
      },
    );
  }
}