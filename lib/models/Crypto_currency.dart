class CruptoCurrency {
  String? id;
  String? symbol;
  String? name;
  String? image;
  int? currentPrice;
  int? marketCap;
  int? marketCapRank;
  int? fullyDilutedValuation;
  int? totalVolume;
  int? high24H;
  int? low24H;
  double? priceChange24H;
  double? priceChangePercentage24H;
  double? marketCapChange24H;
  double? marketCapChangePercentage24H;
  int? circulatingSupply;
  int? totalSupply;
  int? maxSupply;
  int? ath;
  double? athChangePercentage;
  String? athDate;
  double? atl;
  double? atlChangePercentage;
  String? atlDate;
  dynamic roi;
  String? lastUpdated;

  CruptoCurrency(
      {this.id,
      this.symbol,
      this.name,
      this.image,
      this.currentPrice,
      this.marketCap,
      this.marketCapRank,
      this.fullyDilutedValuation,
      this.totalVolume,
      this.high24H,
      this.low24H,
      this.priceChange24H,
      this.priceChangePercentage24H,
      this.marketCapChange24H,
      this.marketCapChangePercentage24H,
      this.circulatingSupply,
      this.totalSupply,
      this.maxSupply,
      this.ath,
      this.athChangePercentage,
      this.athDate,
      this.atl,
      this.atlChangePercentage,
      this.atlDate,
      this.roi,
      this.lastUpdated});

  factory CruptoCurrency.fromJson(Map<String, dynamic> json) {
    return CruptoCurrency(
        id: json["id"],
        symbol: json["symbol"],
        name: json["name"],
        image: json["image"],
        currentPrice: json["current_price"],
        marketCap: json["market_cap"],
        marketCapRank: json["market_cap_rank"],
        fullyDilutedValuation: json["fully_diluted_valuation"],
        totalVolume: json["total_volume"],
        high24H: json["high_24h"],
        low24H: json["low_24h"],
        priceChange24H: json["price_change_24h"],
        priceChangePercentage24H: json["price_change_percentage_24h"],
        marketCapChange24H: json["market_cap_change_24h"],
        marketCapChangePercentage24H: json["market_cap_change_percentage_24h"],
        circulatingSupply: json["circulating_supply"],
        totalSupply: json["total_supply"],
        maxSupply: json["max_supply"],
        ath: json["ath"],
        athChangePercentage: json["ath_change_percentage"],
        athDate: json["ath_date"],
        atl: json["atl"],
        atlChangePercentage: json["atl_change_percentage"],
        atlDate: json["atl_date"],
        roi: json["roi"],
        lastUpdated: json["last_updated"]);
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> _data = <String, dynamic>{};
  //   _data["id"] = id;
  //   _data["symbol"] = symbol;
  //   _data["name"] = name;
  //   _data["image"] = image;
  //   _data["current_price"] = currentPrice;
  //   _data["market_cap"] = marketCap;
  //   _data["market_cap_rank"] = marketCapRank;
  //   _data["fully_diluted_valuation"] = fullyDilutedValuation;
  //   _data["total_volume"] = totalVolume;
  //   _data["high_24h"] = high24H;
  //   _data["low_24h"] = low24H;
  //   _data["price_change_24h"] = priceChange24H;
  //   _data["price_change_percentage_24h"] = priceChangePercentage24H;
  //   _data["market_cap_change_24h"] = marketCapChange24H;
  //   _data["market_cap_change_percentage_24h"] = marketCapChangePercentage24H;
  //   _data["circulating_supply"] = circulatingSupply;
  //   _data["total_supply"] = totalSupply;
  //   _data["max_supply"] = maxSupply;
  //   _data["ath"] = ath;
  //   _data["ath_change_percentage"] = athChangePercentage;
  //   _data["ath_date"] = athDate;
  //   _data["atl"] = atl;
  //   _data["atl_change_percentage"] = atlChangePercentage;
  //   _data["atl_date"] = atlDate;
  //   _data["roi"] = roi;
  //   _data["last_updated"] = lastUpdated;
  //   return _data;
  // }
}
