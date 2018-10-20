import 'dart:convert';

class ProjectCount {
  final int count;

  ProjectCount({
    this.count,
  });

  static ProjectCount fromData(Map<String, dynamic> data){
    ProjectCount result = ProjectCount(
      count: data["count"],
    );
    return result;
  }

  static ProjectCount fromJson(String jsonString){
    Map<String, dynamic> data = json.decode(jsonString);
    return fromData(data);
  }


}
