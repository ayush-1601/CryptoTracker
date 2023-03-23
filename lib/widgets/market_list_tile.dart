import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crypto_tracker/models/Crypto_currency.dart';
import 'package:flutter_crypto_tracker/pages/details_page.dart';
import 'package:flutter_crypto_tracker/providers/market_provider.dart';
import 'package:provider/provider.dart';

class MarketTile extends StatelessWidget {
  final CruptoCurrency currentCrypto;
  const MarketTile({super.key, required this.currentCrypto});

  @override
  Widget build(BuildContext context) {
    MarketProvider marketProvider =
        Provider.of<MarketProvider>(context, listen: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (context) => DetailsPage(
                          id: currentCrypto.id!,
                        )));
          },
          child: Container(
            height: MediaQuery.of(context).size.height * 0.11,
            width: MediaQuery.of(context).size.width * 0.80,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.transparent,
                          backgroundImage: NetworkImage(currentCrypto.image!),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                                child: Text(
                              currentCrypto.name!,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 15),
                            )),

                            Text(
                              "₹ ${currentCrypto.currentPrice!.toStringAsFixed(2)}",
                              style: const TextStyle(
                                  fontSize: 15,
                                  // color: Color.fromARGB(255, 20, 99, 163),
                                  fontWeight: FontWeight.bold),
                            ),

                            // Text(currentCrypto.symbol!.toUpperCase()),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Builder(builder: (context) {
                          double priceChange = currentCrypto.priceChange24H!;
                          double priceChangePercentage =
                              currentCrypto.priceChangePercentage24H!;

                          if (priceChange < 0) {
                            return Text(
                              "₹ ${priceChange.toStringAsFixed(2)} | ${priceChangePercentage.toStringAsFixed(2)}%",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            );
                          } else {
                            return Text(
                              "₹ ${priceChange.toStringAsFixed(2)} | ${priceChangePercentage.toStringAsFixed(2)}%",
                              style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold),
                            );
                          }
                        })
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Container(
          child: (currentCrypto.isFavourite == false)
              ? GestureDetector(
                  onTap: () {
                    marketProvider.addFavorites(currentCrypto);
                  },
                  child: Icon(
                    Icons.favorite_outline,
                  ))
              : GestureDetector(
                  onTap: () {
                    marketProvider.removeFavorites(currentCrypto);
                  },
                  child: Icon(
                    Icons.favorite_outline_outlined,
                    color: Colors.red,
                  )),
        ),
      ],
    );
  }
}
