import 'dart:convert';

class SmwgItem {
  int id;
  String code;
  String name;
  double bobot;
  double nilai;
  int itemType;

  SmwgItem({
    this.id,
    this.code,
    this.name,
    this.bobot,
    this.nilai,
    this.itemType,
  });

  static SmwgItem fromData(Map<String, dynamic> data){
    SmwgItem result = SmwgItem(
      id: data["id"],
      code: data["code"],
      name: data["name"],
      bobot: data["bobot"] != null ? (data["bobot"] as num).toDouble() : 0.0,
      nilai: data["nilai"] != null ? (data["nilai"] as num).toDouble() : 0.0,
      itemType: data["itemType"],
    );
    return result;
  }

  static SmwgItem fromJson(String jsonString){
    Map<String, dynamic> data = json.decode(jsonString);
    return fromData(data);
  }

  static List<SmwgItem> fromJsonArray(String jsonArrayString){
    List data = json.decode(jsonArrayString);
    List<SmwgItem> result = [];
    for(var i=0; i<data.length; i++){
      result.add(fromData(data[i]));
    }
    return result;
  }
}