import 'package:gosuslugi/features/crypto_coin/view/crypto_coin_screen.dart';
import 'package:gosuslugi/features/crypto_list/view/crypto_list_screen.dart';

final routes = {
  '/': (context) => const cryptoListScreen(),
  '/medical': (context) => const cryptoScreen(),
};