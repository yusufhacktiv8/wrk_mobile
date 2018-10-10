import 'dart:io';
import 'dart:async';
import 'dart:convert';

import 'package:dashboard/Constant.dart';


class ProjectCount {
  final double score;
  final double score2;

  ProjectCount({
    this.score,
    this.score2
  });

  static ProjectCount fromJsonArray(String jsonArrayString){
    Map<String, dynamic> data = json.decode(jsonArrayString);
    ProjectCount result = ProjectCount(
      score: data["score"],
      score2: data["score2"],
    );
    return result;
  }
}

class ProjectState{
  ProjectCount project;
  bool loading;
  bool error;

  ProjectState({
    this.project,
    this.loading = true,
    this.error = false,
  });

  void reset(){
    this.project;
    this.loading = true;
    this.error = false;
  }

  Future<void> getFromApi(int month, int year) async{
    try {
      var httpClient = new HttpClient();
      var request = await httpClient.getUrl(Uri.parse('$URL/project?year=$year&month=$month'));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(UTF8.decoder).join();
        this.project = ProjectCount.fromJsonArray(json);
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