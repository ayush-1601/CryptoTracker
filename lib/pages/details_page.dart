import 'package:flutter/material.dart';
import 'package:flutter_crypto_tracker/constants/theme.dart';
import 'package:flutter_crypto_tracker/models/Crypto_currency.dart';
import 'package:flutter_crypto_tracker/providers/market_provider.dart';
import 'package:flutter_crypto_tracker/providers/theme_provider.dart';
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
      body: SafeArea(
          child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Consumer<MarketProvider>(
          builder: (context, marketProvider, child) {
            CruptoCurrency currentCrypto =
                marketProvider.fetchCryptoById(widget.id);
            return RefreshIndicator(
              onRefresh: () async {
                await marketProvider.fetchData();
              },
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                child: Column(
                  children: [
                    Text(
                      currentCrypto.name!,
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Container(
                          height: 120,
                          width: 120,
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
                      "INR ${currentCrypto.currentPrice!.toStringAsFixed(2)}",
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
                        return Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "${priceChangePercentage.toStringAsFixed(2)}%",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 18),
                              ),
                              Icon(
                                Icons.arrow_downward_rounded,
                                color: Colors.red,
                                size: 20,
                              ),
                              Text(
                                "INR ${priceChange.toStringAsFixed(2)}",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 18),
                              )
                            ],
                          ),
                        );
                      } else {
                        return Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "+${priceChangePercentage.toStringAsFixed(2)}%",
                                style: TextStyle(
                                    color: Colors.green, fontSize: 18),
                              ),
                              Icon(
                                Icons.arrow_upward_rounded,
                                color: Colors.green,
                                size: 20,
                              ),
                              Text(
                                "INR ${priceChange.toStringAsFixed(2)}",
                                style: TextStyle(
                                    color: Colors.green, fontSize: 18),
                              )
                            ],
                          ),
                        );
                      }
                    }),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          height: MediaQuery.of(context).size.height - 450,
                          width: MediaQuery.of(context).size.width,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    "Fundamental Analysis",
                                    style: TextStyle(fontSize: 25),
                                  ),
                                ),
                                showAnalysis(
                                    "HIGH", currentCrypto.high24H.toString()),
                                showAnalysis(
                                    "LOW", currentCrypto.low24H.toString()),
                                Container(
                                  padding: EdgeInsets.all(20),
                                  width: MediaQuery.of(context).size.width - 80,
                                  height: 1,
                                  color: darkTheme.scaffoldBackgroundColor,
                                ),
                                showAnalysis("Market Cap",
                                    currentCrypto.marketCap.toString()),
                                showAnalysis("Total Volume",
                                    currentCrypto.totalVolume.toString()),
                                showAnalysis("Circulating Supply",
                                    currentCrypto.circulatingSupply.toString()),
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      )),
    );
  }

  Widget showAnalysis(String analysisName, String analysisValue) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(analysisName), Text("INR ${analysisValue}")],
      ),
    );
  }
}
