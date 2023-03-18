import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_crypto_tracker/models/Crypto_API.dart';
import 'package:flutter_crypto_tracker/models/Crypto_currency.dart';

class MarketProvider with ChangeNotifier {
  bool isLoading = true;
  List<CruptoCurrency> markets = [];

  MarketProvider() {
    fetchData();
  }

  Future<void> fetchData() async {
    List<dynamic> _market = await CryptoApi.getMarket();

    List<CruptoCurrency> temp = [];

    for (dynamic market in _market) {
      CruptoCurrency newCrypto = CruptoCurrency.fromJson(market);
      temp.add(newCrypto);
    }

    markets = temp;
    isLoading = false;
    notifyListeners();

    // Timer(const Duration(seconds: 3), () {
    //   fetchData();
    //   print("data updated");
    // });
  }

  CruptoCurrency fetchCryptoById(String id) {
    CruptoCurrency crypto =
        markets.where((element) => element.id == id).toList()[0];
    return crypto;
  }
}
