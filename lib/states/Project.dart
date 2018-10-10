import 'dart:convert';

class Project {
  final String name;

  Project({
    this.name,
  });

  static Project fromJson(String jsonArrayString){
    Map<String, dynamic> data = json.decode(jsonArrayString);
    Project result = Project(
      name: data["name"],
    );
    return result;
  }

  static List<Project> fromJsonArray(String jsonArrayString){
    List data = json.decode(jsonArrayString);
    List<Project> result = [];
    for(var i=0; i<data.length; i++){
      result.add(new Project(
        name: data[i]["Project"]["name"],
      ));
    }
    return result;
  }
}