import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Crypto_coins_repository {
  Future<void> getCoinsList() async {
    final response = await Dio().get(
    '/data/price?fsym=BTC&tsyms=USD,JPY,EUR'
    );
    debugPrint(response.toString());
  }
}