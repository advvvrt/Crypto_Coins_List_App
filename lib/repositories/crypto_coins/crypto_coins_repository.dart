import 'package:dio/dio.dart';
import 'package:gosuslugi/repositories/crypto_coins/abstract_coins_repository.dart';
import 'package:gosuslugi/repositories/crypto_coins/models/crypto_coin.dart';


class Crypto_coins_repository implements AbstractCoinsRepository{

  Crypto_coins_repository({
    required this.dio
  });

  final Dio dio;



  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    final response = await dio.get(
      'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,AID,NMR,TDS,ZT,ZPR&tsyms=USD',
    );

    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final CryptoCoinsList =
        dataRaw.entries
            .map(
              (e) {
                final usdData = (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
                final price = usdData['PRICE'];
                final imageUrl = usdData['IMAGEURL'];
                return CryptoCoin(
                    Name: e.key,
                    priceInUSD: price,
                    imageUrl: 'https://www.cryptocompare.com/$imageUrl',
                );
              }
            )
            .toList();
    return CryptoCoinsList;
  }
}
