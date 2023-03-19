import 'package:flutter/material.dart';
import 'package:flutter_crypto_tracker/models/Crypto_currency.dart';
import 'package:flutter_crypto_tracker/providers/market_provider.dart';
import 'package:flutter_crypto_tracker/widgets/market_list_tile.dart';
import 'package:provider/provider.dart';

class Favourites extends StatefulWidget {
  const Favourites({super.key});

  @override
  State<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MarketProvider>(builder: (context, marketProvider, child) {
      List<CruptoCurrency> favorites = marketProvider.markets
          .where((element) => element.isFavourite == true)
          .toList();

      if (favorites.isNotEmpty) {
        return ListView.builder(
          itemCount: favorites.length,
          itemBuilder: (BuildContext context, int index) {
            CruptoCurrency currentCrypto = favorites[index];
            return MarketTile(currentCrypto: currentCrypto);
          },
        );
      } else {
        return Center(
          child: Text(
            "No Favourites Yet!!",
            style: TextStyle(
                color: Color.fromARGB(255, 92, 99, 102), fontSize: 20),
          ),
        );
      }
    });
  }
}
