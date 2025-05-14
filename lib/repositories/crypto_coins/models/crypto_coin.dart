import 'package:equatable/equatable.dart';

class CryptoCoin extends Equatable{
  CryptoCoin( {
    required this.Name,
    required this.priceInUSD,
    required this.imageUrl
  });

  final String Name;
  final double priceInUSD;
  final String imageUrl;

  @override
  List<Object?> get props => [Name, priceInUSD, imageUrl];
}