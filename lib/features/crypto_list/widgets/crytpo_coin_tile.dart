import 'package:flutter/material.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({
    super.key,
    required this.serviceName,
  });

  final String serviceName;


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Image.asset(
          'assets/image/bitcoin.png',
          height: 50,
          width: 50,
        ),
      ),
      title: Text(
        serviceName,
        style: theme.textTheme.bodyMedium,
      ),
      subtitle: Text('95000\$', style: theme.textTheme.labelSmall),
      trailing: const Icon(Icons.arrow_circle_right),
      onTap: () {
        Navigator.of(context).pushNamed('/medical',
          arguments: serviceName,
        );
      },
    );
  }
}