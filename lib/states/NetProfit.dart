import 'dart:io';
import 'dart:async';

import 'dart:convert';

import 'package:dashboard/Constant.dart';

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

  static NetProfit fromJsonArray(String jsonArrayString){
    Map<String, dynamic> data = json.decode(jsonArrayString);
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
}

class NetProfitState{
  NetProfit netProfit;
  bool loading;
  bool error;

  NetProfitState({
    this.netProfit,
    this.loading = true,
    this.error = false,
  });

  void reset(){
    this.netProfit;
    this.loading = true;
    this.error = false;
  }

  Future<void> getFromApi() async{
    try {
      var httpClient = new HttpClient();
      var request = await httpClient.getUrl(Uri.parse(URL + '/netprofit?year=2018&month=1'));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(UTF8.decoder).join();
        this.netProfit = NetProfit.fromJsonArray(json);
        this.loading = false;
        this.error = false;
      }
      else{
        this.netProfit;
        this.loading = false;
        this.error = true;
      }
    } catch (exception) {
      this.netProfit;
      this.loading = false;
      this.error = true;
    }
  }
}