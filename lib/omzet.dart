import 'dart:io';
import 'dart:async';

import 'dart:convert';

class Omzet {
  final int userId;

  final int id;

  final String title;

  final String body;

  Omzet({
    this.userId,
    this.id,
    this.title,
    this.body
  });

  static List<Omzet> fromJsonArray(String jsonArrayString){
    List data = JSON.decode(jsonArrayString);
    List<Omzet> result = [];
    for(var i=0; i<data.length; i++){
      result.add(new Omzet(
          userId: data[i]["userId"],
          id: data[i]["id"],
          title: data[i]["title"],
          body: data[i]["body"]
      ));
    }
    return result;
  }
}

class PostState{
  List<Omzet> posts;
  bool loading;
  bool error;

  PostState({
    this.posts = const [],
    this.loading = true,
    this.error = false,
  });

  void reset(){
    this.posts = [];
    this.loading = true;
    this.error = false;
  }

  Future<void> getFromApi() async{
    try {
      var httpClient = new HttpClient();
      var request = await httpClient.getUrl(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(UTF8.decoder).join();
        this.posts = Omzet.fromJsonArray(json);
        this.loading = false;
        this.error = false;
      }
      else{
        this.posts = [];
        this.loading = false;
        this.error = true;
      }
    } catch (exception) {
      this.posts = [];
      this.loading = false;
      this.error = true;
    }
  }
}