import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:gosuslugi/features/crypto_list/bloc/crypto_list_bloc.dart';
import 'package:gosuslugi/features/crypto_list/widgets/crytpo_coin_tile.dart';
import 'package:gosuslugi/repositories/crypto_coins/crypto_coins.dart';
import 'package:gosuslugi/theme/theme.dart';

class cryptoListScreen extends StatefulWidget {
  const cryptoListScreen({super.key});

  @override
  State<cryptoListScreen> createState() => _cryptoListScreenState();
}

class _cryptoListScreenState extends State<cryptoListScreen> {
  final _cryptoListBloc = CryptoListBloc(GetIt.I<AbstractCoinsRepository>());

  @override
  void initState() {
    _cryptoListBloc.add(LoadCryptoList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Crypto App'), centerTitle: true),
      body: BlocBuilder<CryptoListBloc, CryptoListState>(
        bloc: _cryptoListBloc,
        builder: (context, state) {
          if (state is CryptoListLoaded) {
            return ListView.separated(
              padding: EdgeInsets.only(top: 16),
              itemCount: state.coinsList.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, i) {
                final coin = state.coinsList[i];
                return CryptoCoinTile(Coin: coin);
              },
            );
          }
          if (state is CryptoListLoadingFailure) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                      'Something went wrong',
                    style: darktheme.textTheme.headlineMedium,
                  ),
                  Text(
                      'Please try again later',
                    style: darktheme.textTheme.headlineSmall?.copyWith(fontSize: 16),
                  ),
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      // (_cryptoCoinsList == null)
      //     ? const Center(child: CircularProgressIndicator())
      //     : ListView.separated(
      //       padding: EdgeInsets.only(top: 16),
      //       itemCount: _cryptoCoinsList!.length,
      //       separatorBuilder: (context, index) => Divider(),
      //       itemBuilder: (context, i) {
      //         final coin = _cryptoCoinsList![i];
      //         return CryptoCoinTile(Coin: coin);
      //       },
      //     ),
    );
  }
}
