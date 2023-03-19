import 'dart:convert';

import 'package:flutter_crypto_tracker/models/Crypto_currency.dart';
import 'package:http/http.dart' as http;

class CryptoApi {
  static Future<List<dynamic>> getMarket() async {
    // List<CruptoCurrency> markets = [];
    try {
      Uri requestPath = Uri.parse(
          "https://api.coingecko.com/api/v3/coins/markets?vs_currency=inr&order=market_cap_desc&per_page=20&page=1&sparkline=false");

      var response = await http.get(requestPath);
      var decodedResponse = jsonDecode(response.body);
      List<dynamic> markets = decodedResponse as List<dynamic>;
      return markets;
    } catch (e) {
      return [];
    }

    // if (response.statusCode == 200) {
    //   print("code found yee");
    //   for (Map i in decodedResponse) {
    //     markets.add(CruptoCurrency.fromJson(i.cast()));
    //   }
    //   return markets;
    // } else {
    //   print("nahi aya");
    //   return markets;
    // }
  }

  Future<List<dynamic>> getChart(String cid) async {
    try {
      Uri requestPath = Uri.parse(
          "https://api.coingecko.com/api/v3/coins/${cid}/market_chart?vs_currency=inr&days=7");

      var response = await http.get(requestPath);
      var decodedResponse = jsonDecode(response.body);
      List<dynamic> charts = decodedResponse as List<dynamic>;
      return charts;
    } catch (e) {
      return [];
    }
  }
}
