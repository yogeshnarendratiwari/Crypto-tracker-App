class CryptoCurrency {
  String? id;
  String? symbol;
  String? name;
  double? currentPrice;
  String? image;
  double? marketCap;
  int? marketCapRank;
  double? high_24h;
  double? low_24h;
  double? price_change_24h;
  double? price_percentage_change_24h;
  double? circulatingSupply;
  double? ath;
  double? atl;
  bool isFav = false;
  CryptoCurrency(
      {required this.id,
      required this.symbol,
      required this.name,
      required this.currentPrice,
      required this.image,
      required this.marketCap,
      required this.marketCapRank,
      required this.high_24h,
      required this.low_24h,
      required this.price_change_24h,
      required this.price_percentage_change_24h,
      required this.circulatingSupply,
      required this.ath,
      required this.atl,
      });

  factory CryptoCurrency.fromJSON(Map<String, dynamic> map) {
    return CryptoCurrency(
        id: map["id"],
        symbol: map["symbol"],
        name: map["name"],
        currentPrice: double.parse(map["current_price"].toString()),
        image: map["image"],
        marketCap: double.parse(map["market_cap"].toString()),
        marketCapRank: map["market_cap_rank"],
        high_24h: double.parse(map["high_24h"].toString()),
        low_24h: double.parse(map["low_24h"].toString()),
        price_change_24h: double.parse(map["price_change_24h"].toString()),
        price_percentage_change_24h: double.parse(map["price_change_percentage_24h"].toString()),
        circulatingSupply: double.parse(map["circulating_supply"].toString()),
        ath: double.parse(map["ath"].toString()),
        atl: double.parse(map["atl"].toString()));
  }
}
