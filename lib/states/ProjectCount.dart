import 'dart:convert';

class ProjectCount {
  final int count;

  ProjectCount({
    this.count,
  });

  static ProjectCount fromJsonArray(String jsonArrayString){
    Map<String, dynamic> data = json.decode(jsonArrayString);
    ProjectCount result = ProjectCount(
      count: data["count"]
    );
    return result;
  }
}

class ProjectState{
  ProjectCount project;
  bool loading;
  bool error;

  ProjectState({
    this.project,
    this.loading = true,
    this.error = false,
  });

  void reset(){
    this.project;
    this.loading = true;
    this.error = false;
  }
}