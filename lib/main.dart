import 'dart:math';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:gosuslugi/crypto_coins_list_app.dart';
import 'package:gosuslugi/repositories/crypto_coins/crypto_coins.dart';

void main() {
  GetIt.I.registerLazySingleton<AbstractCoinsRepository>(
    () => Crypto_coins_repository(dio: Dio()),
  );

  runApp(const cryptoApp());
}
