import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crypto_tracker/models/Crypto_currency.dart';
import 'package:flutter_crypto_tracker/pages/details_page.dart';
import 'package:flutter_crypto_tracker/providers/market_provider.dart';
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
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              itemCount: marketProvider.markets.length,
              itemBuilder: (BuildContext context, int index) {
                CruptoCurrency currentCrypto = marketProvider.markets[index];
                return ListTile(
                  onTap: (() {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => DetailsPage(
                                  id: currentCrypto.id!,
                                )));
                  }),
                  // shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(10)),
                  // tileColor: Color.fromARGB(255, 39, 41, 50),
                  contentPadding: EdgeInsets.all(0),
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(currentCrypto.image!),
                  ),
                  title: Row(
                    children: [
                      Flexible(
                          child: Text(
                        currentCrypto.name!,
                        overflow: TextOverflow.ellipsis,
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      (currentCrypto.isFavourite == false)
                          ? GestureDetector(
                              onTap: () {
                                marketProvider.addFavorites(currentCrypto);
                              },
                              child: Icon(Icons.favorite_border_rounded))
                          : GestureDetector(
                              onTap: () {
                                marketProvider.removeFavorites(currentCrypto);
                              },
                              child: Icon(
                                Icons.favorite_rounded,
                                color: Colors.red,
                              ))
                    ],
                  ),
                  subtitle: Text(currentCrypto.symbol!.toUpperCase()),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "INR ${currentCrypto.currentPrice!.toStringAsFixed(4)}",
                        style: const TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 20, 99, 163),
                            fontWeight: FontWeight.bold),
                      ),
                      Builder(builder: (context) {
                        double priceChange = currentCrypto.priceChange24H!;
                        double priceChangePercentage =
                            currentCrypto.priceChangePercentage24H!;

                        if (priceChange < 0) {
                          return Text(
                            "${priceChangePercentage.toStringAsFixed(2)}% (${priceChange.toStringAsFixed(4)})",
                            style: TextStyle(color: Colors.red),
                          );
                        } else {
                          return Text(
                            "+${priceChangePercentage.toStringAsFixed(2)}% (+${priceChange.toStringAsFixed(4)})",
                            style: TextStyle(color: Colors.green),
                          );
                        }
                      })
                    ],
                  ),
                );
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
