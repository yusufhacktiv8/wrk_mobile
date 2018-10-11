import 'dart:convert';

class Project {
  final String name;
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

  Project({
    this.name,
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

  static List<Project> fromJsonArray(String jsonArrayString){
    List data = json.decode(jsonArrayString);
    List<Project> result = [];
    for(var i=0; i<data.length; i++){
      result.add(new Project(
        name: data[i]["Project"]["name"],
          ra: data[i]["ra"] != null ? (data[i]["ra"] as num).toDouble() : 0.0,
          ri: data[i]["ri"] != null ? (data[i]["ri"] as num).toDouble() : 0.0,
          raProgress: data[i]["raProgress"] != null ? (data[i]["raProgress"] as num).toDouble() : 0.0,
          riProgress: data[i]["riProgress"] != null ? (data[i]["riProgress"] as num).toDouble() : 0.0,
          pdp: data[i]["pdp"] != null ? (data[i]["pdp"] as num).toDouble() : 0.0,
          bad: data[i]["bad"] != null ? (data[i]["bad"] as num).toDouble() : 0.0,
          ok: data[i]["ok"] != null ? (data[i]["ok"] as num).toDouble() : 0.0,
          piutangUsaha: data[i]["piutangUsaha"] != null ? (data[i]["piutangUsaha"] as num).toDouble() : 0.0,
          piutangRetensi: data[i]["piutangRetensi"] != null ? (data[i]["piutangRetensi"] as num).toDouble() : 0.0,
          tagihanBruto: data[i]["tagihanBruto"] != null ? (data[i]["tagihanBruto"] as num).toDouble() : 0.0,
          persediaan: data[i]["persediaan"] != null ? (data[i]["persediaan"] as num).toDouble() : 0.0,
          cashflow: data[i]["cashflow"] != null ? (data[i]["cashflow"] as num).toDouble() : 0.0,
          labaKotor: data[i]["labaKotor"] != null ? (data[i]["labaKotor"] as num).toDouble() : 0.0,
      ));
    }
    return result;
  }
}