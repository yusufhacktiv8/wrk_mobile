import 'dart:convert';

class Project {
  final String name;
  final double ra;
  final double ri;
  final double pdp;

  Project({
    this.name,
    this.ra,
    this.ri,
    this.pdp,
  });

  static List<Project> fromJsonArray(String jsonArrayString){
    List data = json.decode(jsonArrayString);
    List<Project> result = [];
    for(var i=0; i<data.length; i++){
      result.add(new Project(
        name: data[i]["Project"]["name"],
          ra: data[i]["ra"] != null ? (data[i]["ra"] as num).toDouble() : 0.0,
          ri: data[i]["ri"] != null ? (data[i]["ri"] as num).toDouble() : 0.0,
          pdp: data[i]["pdp"] != null ? (data[i]["pdp"] as num).toDouble() : 0.0,
      ));
    }
    return result;
  }
}