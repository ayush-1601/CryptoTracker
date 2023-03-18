import 'package:flutter/material.dart';
import 'package:flutter_crypto_tracker/models/Crypto_currency.dart';
import 'package:flutter_crypto_tracker/providers/market_provider.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatefulWidget {
  final String id;
  const DetailsPage({super.key, required this.id});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // leading: Icon(Icons.arrow_back_ios_sharp),
          ),
      body: SafeArea(child: Container(
        child: Consumer<MarketProvider>(
          builder: (context, marketProvider, child) {
            CruptoCurrency currentCrypto =
                marketProvider.fetchCryptoById(widget.id);
            return Column(
              children: [
                Text(
                  currentCrypto.name!,
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                      height: 150,
                      width: 150,
                      child: Image.network(
                        currentCrypto.image!,
                        fit: BoxFit.cover,
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  currentCrypto.symbol!.toUpperCase(),
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "INR ${currentCrypto.currentPrice!.toStringAsFixed(4)}",
                  style: const TextStyle(
                      fontSize: 28,
                      color: Color.fromARGB(255, 20, 99, 163),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Builder(builder: (context) {
                  double priceChange = currentCrypto.priceChange24H!;
                  double priceChangePercentage =
                      currentCrypto.priceChangePercentage24H!;

                  if (priceChange < 0) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "${priceChangePercentage.toStringAsFixed(2)}%",
                          style: TextStyle(color: Colors.red, fontSize: 18),
                        ),
                        Text(
                          "${priceChange.toStringAsFixed(4)}",
                          style: TextStyle(color: Colors.red, fontSize: 18),
                        )
                      ],
                    );
                  } else {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "+${priceChangePercentage.toStringAsFixed(2)}%",
                          style: TextStyle(color: Colors.green, fontSize: 18),
                        ),
                        Text(
                          "+${priceChange.toStringAsFixed(4)}",
                          style: TextStyle(color: Colors.green, fontSize: 18),
                        )
                      ],
                    );
                  }
                }),
              ],
            );
          },
        ),
      )),
    );
  }
}
