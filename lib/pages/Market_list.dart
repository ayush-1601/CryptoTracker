import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crypto_tracker/models/Crypto_currency.dart';
import 'package:flutter_crypto_tracker/pages/details_page.dart';
import 'package:flutter_crypto_tracker/providers/market_provider.dart';
import 'package:flutter_crypto_tracker/widgets/market_list_tile.dart';
import 'package:provider/provider.dart';

class MarketList extends StatefulWidget {
  MarketList({Key? key}) : super(key: key);

  @override
  State<MarketList> createState() => _MarketListState();
}

class _MarketListState extends State<MarketList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MarketProvider>(builder: (context, marketProvider, child) {
      if (marketProvider.isLoading == true) {
        return Center(
            child: CircularProgressIndicator(
          color: Colors.amber,
        ));
      } else {
        if (marketProvider.markets.isNotEmpty) {
          return RefreshIndicator(
            onRefresh: () async {
              await marketProvider.fetchData();
            },
            child: ListView.builder(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              itemCount: marketProvider.markets.length,
              itemBuilder: (BuildContext context, int index) {
                CruptoCurrency currentCrypto = marketProvider.markets[index];
                return MarketTile(currentCrypto: currentCrypto);
              },
            ),
          );
        } else {
          return Text("data not found");
        }
      }
    });
  }
}
