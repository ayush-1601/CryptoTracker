import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_crypto_tracker/models/Crypto_currency.dart';
import 'package:flutter_crypto_tracker/providers/market_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Crypto Today",
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Consumer<MarketProvider>(
                  builder: (context, marketProvider, child) {
                if (marketProvider.isLoading == true) {
                  return Center(
                      child: CircularProgressIndicator(
                    color: Colors.amber,
                  ));
                } else {
                  if (marketProvider.markets.isNotEmpty) {
                    return ListView.builder(
                      physics: BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      itemCount: marketProvider.markets.length,
                      itemBuilder: (BuildContext context, int index) {
                        CruptoCurrency currentCrypto =
                            marketProvider.markets[index];
                        return ListTile(
                          contentPadding: EdgeInsets.all(0),
                          leading: CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage: NetworkImage(currentCrypto.image!),
                          ),
                          title: Text(currentCrypto.name! +
                              " #${currentCrypto.marketCapRank!}"),
                          subtitle: Text(currentCrypto.symbol!.toUpperCase()),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "INR " +
                                    currentCrypto.currentPrice!
                                        .toStringAsFixed(4),
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 4, 70, 123),
                                    fontWeight: FontWeight.bold),
                              ),
                              Builder(builder: (context) {
                                double priceChange =
                                    currentCrypto.priceChange24H!;
                                double priceChangePercentage =
                                    currentCrypto.priceChangePercentage24H!;

                                if (priceChange < 0) {
                                  return Text(
                                    "${priceChangePercentage.toStringAsFixed(2)} (${priceChange.toStringAsFixed(4)})",
                                    style: TextStyle(color: Colors.red),
                                  );
                                } else {
                                  return Text(
                                    "+${priceChangePercentage.toStringAsFixed(2)} (+${priceChange.toStringAsFixed(4)})",
                                    style: TextStyle(color: Colors.green),
                                  );
                                }
                              })
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return Text("data not found");
                  }
                }
              }),
            )
          ],
        ),
      )),
    );
  }
}
