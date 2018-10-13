import 'dart:convert';

class Project {
  int id;
  String code;
  String name;

  Project({
    this.id,
    this.code,
    this.name
  });

  static Project fromData(Map<String, dynamic> data){
    Project result = Project(
      id: data["id"],
      code: data["code"],
      name: data["name"],
    );
    return result;
  }

  static Project fromJson(String jsonString){
    Map<String, dynamic> data = json.decode(jsonString);
    return fromData(data);
  }
}