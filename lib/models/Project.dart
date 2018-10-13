import 'dart:convert';

class Project {
  int id;
  String code;
  String name;
  String address;
  String givenBy;
  double omzetKontrak;
  DateTime startDate;
  DateTime endDate;
  String mp;
  String keu;
  String kom;
  String pelut;
  String eng;

  Project({
    this.id,
    this.code,
    this.name,
    this.address,
    this.givenBy,
    this.omzetKontrak,
    this.startDate,
    this.endDate,
    this.mp,
    this.keu,
    this.kom,
    this.pelut,
    this.eng,
  });

  static Project fromData(Map<String, dynamic> data){
    Project result = Project(
      id: data["id"],
      code: data["code"],
      name: data["name"],
      address: data["address"],
      givenBy: data["givenBy"],
      omzetKontrak: data["omzetKontrak"] != null ? (data["omzetKontrak"] as num).toDouble() : 0.0,
      startDate: data["startDate"] != null ? DateTime.parse(data["startDate"]) : null,
      endDate: data["endDate"] != null ? DateTime.parse(data["endDate"]) : null,
      mp: data["mp"],
      keu: data["keu"],
      kom: data["kom"],
      pelut: data["pelut"],
      eng: data["eng"],
    );
    return result;
  }

  static Project fromJson(String jsonString){
    Map<String, dynamic> data = json.decode(jsonString);
    return fromData(data);
  }
}