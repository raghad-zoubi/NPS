import 'dart:convert';


class GradesModel {




  final id;
  final date;
  final name;
  final highMark;
  final lowMark;
  final studentMark;
  final semester;


  GradesModel(
      {this.id,
        this.name,
        this.studentMark,
        this.date,
        this.highMark,
        this.semester,
        this.lowMark,
      });

  factory GradesModel.fromJson(Map<String, dynamic> json) => GradesModel(

    highMark: json['highMark']??"2",
    date: json['date']??"3",
    studentMark: json['studentMark']??"4",
    semester: json['semester']??"5",
    lowMark: json['lowMark']??"6",
    name: json['name']??"7",
    id: json['id']??"8",

  );

  Map<String, dynamic> toJson() => {
    "highMark": highMark,
    "lowMark": lowMark,
    "date": date,
    "date": date,
    "name": name,
    "id": id,
    "studentMark": studentMark,
  };
}
