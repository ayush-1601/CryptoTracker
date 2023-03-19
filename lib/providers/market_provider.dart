import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_crypto_tracker/models/Crypto_API.dart';
import 'package:flutter_crypto_tracker/models/Crypto_currency.dart';
import 'package:flutter_crypto_tracker/models/local_storage.dart';

class MarketProvider with ChangeNotifier {
  bool isLoading = true;
  List<CruptoCurrency> markets = [];

  MarketProvider() {
    fetchData();
  }

  Future<void> fetchData() async {
    List<dynamic> _market = await CryptoApi.getMarket();
    List<String> favorites = await LocalStorage.fetchFavourites();

    List<CruptoCurrency> temp = [];

    for (dynamic market in _market) {
      CruptoCurrency newCrypto = CruptoCurrency.fromJson(market);

      if (favorites.contains(newCrypto.id!)) {
        newCrypto.isFavourite = true;
      }
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

  void addFavorites(CruptoCurrency crypto) async {
    int indexofCrypto = markets.indexOf(crypto);
    markets[indexofCrypto].isFavourite = true;
    await LocalStorage.addFavourites(crypto.id!);
    notifyListeners();
  }

  void removeFavorites(CruptoCurrency crypto) async {
    int indexofCrypto = markets.indexOf(crypto);
    markets[indexofCrypto].isFavourite = false;
    await LocalStorage.removeFavourites(crypto.id!);
    notifyListeners();
  }
}
