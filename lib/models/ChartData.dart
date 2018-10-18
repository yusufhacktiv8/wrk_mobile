import 'dart:convert';

class ChartData {
  final int month;
  final double plan;
  final double actual;

  ChartData({
    this.month,
    this.plan,
    this.actual,
  });

  static ChartData fromData(Map<String, dynamic> data){
    ChartData result = ChartData(
      month: data["month"],
      plan: data["plan"] != null ? (data["plan"] as num).toDouble() : 0.0,
      actual: data["actual"] != null ? (data["actual"] as num).toDouble() : 0.0,
    );
    return result;
  }

  static ChartData fromJson(String jsonString){
    Map<String, dynamic> data = json.decode(jsonString);
    return fromData(data);
  }

  static List<ChartData> fromJsonArray(String jsonArrayString){
    List data = json.decode(jsonArrayString);
    List<ChartData> result = [];
    for(var i=0; i<data.length; i++){
      result.add(fromData(data[i]));
    }
    return result;
  }

}