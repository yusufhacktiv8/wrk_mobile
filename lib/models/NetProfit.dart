import 'dart:convert';

class NetProfit {
  final int month;
  final int year;
  final double rkap;
  final double ra;
  final double ri;
  final double prognosa;

  NetProfit({
    this.month,
    this.year,
    this.rkap,
    this.ra,
    this.ri,
    this.prognosa
  });

  static NetProfit fromData(Map<String, dynamic> data){
    NetProfit result = NetProfit(
      month: data["month"],
      year: data["year"],
      rkap: (data["rkap"] as num).toDouble(),
      ra: (data["ra"] as num).toDouble(),
      ri: (data["ri"] as num).toDouble(),
      prognosa: (data["prognosa"] as num).toDouble(),
    );
    return result;
  }

  static NetProfit fromJson(String jsonString){
    Map<String, dynamic> data = json.decode(jsonString);
    return fromData(data);
  }
}