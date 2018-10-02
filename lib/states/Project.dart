import 'dart:io';
import 'dart:async';
import 'dart:convert';

import 'package:dashboard/Constant.dart';


class Project {
  final double score;

  Project({
    this.score
  });

  static Project fromJsonArray(String jsonArrayString){
    Map<String, dynamic> data = json.decode(jsonArrayString);
    Project result = Project(
      score: data["score"],
    );
    return result;
  }
}

class ProjectState{
  Project project;
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

  Future<void> getFromApi() async{
    try {
      var httpClient = new HttpClient();
      var request = await httpClient.getUrl(Uri.parse(URL + '/project?year=2018&month=1'));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(UTF8.decoder).join();
        this.project = Project.fromJsonArray(json);
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