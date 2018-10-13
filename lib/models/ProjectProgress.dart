import 'dart:convert';
import 'package:dashboard/models/Project.dart';

class ProjectProgress {
  final Project project;
  final double ra;
  final double ri;
  final double raProgress;
  final double riProgress;
  final double pdp;
  final double bad;
  final double ok;
  final double piutangUsaha;
  final double piutangRetensi;
  final double tagihanBruto;
  final double persediaan;
  final double cashflow;
  final double labaKotor;

  ProjectProgress({
    this.project,
    this.ra,
    this.ri,
    this.pdp,
    this.bad,
    this.ok,
    this.raProgress,
    this.riProgress,
    this.piutangUsaha,
    this.piutangRetensi,
    this.tagihanBruto,
    this.persediaan,
    this.cashflow,
    this.labaKotor,
  });

  static ProjectProgress fromData(Map<String, dynamic> data){
    return ProjectProgress(
      project: Project.fromData(data["Project"]),
      ra: data["ra"] != null ? (data["ra"] as num).toDouble() : 0.0,
      ri: data["ri"] != null ? (data["ri"] as num).toDouble() : 0.0,
      raProgress: data["raProgress"] != null ? (data["raProgress"] as num).toDouble() : 0.0,
      riProgress: data["riProgress"] != null ? (data["riProgress"] as num).toDouble() : 0.0,
      pdp: data["pdp"] != null ? (data["pdp"] as num).toDouble() : 0.0,
      bad: data["bad"] != null ? (data["bad"] as num).toDouble() : 0.0,
      ok: data["ok"] != null ? (data["ok"] as num).toDouble() : 0.0,
      piutangUsaha: data["piutangUsaha"] != null ? (data["piutangUsaha"] as num).toDouble() : 0.0,
      piutangRetensi: data["piutangRetensi"] != null ? (data["piutangRetensi"] as num).toDouble() : 0.0,
      tagihanBruto: data["tagihanBruto"] != null ? (data["tagihanBruto"] as num).toDouble() : 0.0,
      persediaan: data["persediaan"] != null ? (data["persediaan"] as num).toDouble() : 0.0,
      cashflow: data["cashflow"] != null ? (data["cashflow"] as num).toDouble() : 0.0,
      labaKotor: data["labaKotor"] != null ? (data["labaKotor"] as num).toDouble() : 0.0,
    );
  }

  static ProjectProgress fromJson(String jsonString){
    Map<String, dynamic> data = json.decode(jsonString);
    return fromData(data);
  }

  static List<ProjectProgress> fromJsonArray(String jsonArrayString){
    List data = json.decode(jsonArrayString);
    List<ProjectProgress> result = [];
    for(var i=0; i<data.length; i++){
      result.add(fromData(data[i]));
    }
    return result;
  }
}