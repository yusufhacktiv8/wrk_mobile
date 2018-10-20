import 'dart:io';
import 'dart:async';
import 'dart:convert';

import 'package:dashboard/Constant.dart';


class ScoreCard {
  final double score;

  ScoreCard({
    this.score
  });

  static ScoreCard fromJsonArray(String jsonArrayString){
    Map<String, dynamic> data = json.decode(jsonArrayString);
    ScoreCard result = ScoreCard(
      score: data["score"],
    );
    return result;
  }
}

class ScoreCardState{
  ScoreCard project;
  bool loading;
  bool error;

  ScoreCardState({
    this.project,
    this.loading = true,
    this.error = false,
  });

  void reset(){
    this.project;
    this.loading = true;
    this.error = false;
  }

  Future<void> getFromApi() async{
    try {
      var httpClient = new HttpClient();
      var request = await httpClient.getUrl(Uri.parse(URL + '/scorecard?year=2018&month=1'));
      var response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        var json = await response.transform(utf8.decoder).join();
        this.project = ScoreCard.fromJsonArray(json);
        this.loading = false;
        this.error = false;
      }
      else{
        this.project;
        this.loading = false;
        this.error = true;
      }
    } catch (exception) {
      this.project;
      this.loading = false;
      this.error = true;
    }
  }
}