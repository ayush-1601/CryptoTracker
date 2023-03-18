import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
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
                    return Text("data found");
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
