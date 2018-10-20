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

  static ChartData fromData(Map<String, dynamic> data, String planField, String actualField){
    ChartData result = ChartData(
      month: data["month"],
      plan: data[planField] != null ? (data[planField] as num).toDouble() : 0.0,
      actual: data[actualField] != null ? (data[actualField] as num).toDouble() : 0.0,
    );
    return result;
  }

  static ChartData fromJson(String jsonString, String planField, String actualField){
    Map<String, dynamic> data = json.decode(jsonString);
    return fromData(data, planField, actualField);
  }

  static List<ChartData> fromJsonArray(String jsonArrayString, String planField, String actualField){
    List data = json.decode(jsonArrayString);
    List<ChartData> result = [];
    for(var i=0; i<data.length; i++){
      result.add(fromData(data[i], planField, actualField));
    }
    return result;
  }

}