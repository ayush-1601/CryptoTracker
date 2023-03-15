import 'package:flutter/cupertino.dart';
import 'package:flutter_crypto_tracker/models/Crypto_API.dart';
import 'package:flutter_crypto_tracker/models/Crypto_currency.dart';

class MarketProvider with ChangeNotifier {
  bool isLoading = false;
  List<CruptoCurrency> markets = [];

  void fetchData() async {
    List<dynamic> _markets = await CryptoApi.getMarket();

    List<CruptoCurrency> temp = [];

    for (var market in _markets) {
      CruptoCurrency newCrypto = CruptoCurrency.fromJson(market);
      temp.add(newCrypto);
    }

    markets = temp;
    isLoading = false;
    notifyListeners();
  }
}
