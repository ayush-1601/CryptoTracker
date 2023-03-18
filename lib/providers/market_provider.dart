import 'package:flutter/cupertino.dart';
import 'package:flutter_crypto_tracker/models/Crypto_API.dart';
import 'package:flutter_crypto_tracker/models/Crypto_currency.dart';

class MarketProvider with ChangeNotifier {
  bool isLoading = true;
  List<CruptoCurrency> markets = [];

  MarketProvider() {
    fetchData();
  }

  void fetchData() async {
    List<dynamic> _market = await CryptoApi.getMarket();

    List<CruptoCurrency> temp = [];

    for (dynamic market in _market) {
      CruptoCurrency newCrypto = CruptoCurrency.fromJson(market);
      temp.add(newCrypto);
    }

    markets = temp;
    isLoading = false;
    notifyListeners();
  }
}
