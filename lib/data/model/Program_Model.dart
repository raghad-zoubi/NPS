import 'dart:convert';



class ProgramModel {

  final name;
  final session;
  final day;

  ProgramModel({

    this.name,
    this.session,
    this.day,
  });

  factory ProgramModel.fromJson(Map<String, dynamic> json) => ProgramModel(
    name: json['name'] ?? "2",
    session: json['session'] ?? "2",
    day: json['day'] ?? "2",

  );

  Map<String, dynamic> toJson() => {
    "name": name.toJson(),
    "day": day.toJson(),
    "session": session.toJson(),

  };
}


class ProgramnameModel {

  final day;
  final name1;
  final name2;
  final name3;
  final name4;
  final name5;
  final name6;
  final name7;

  ProgramnameModel({

    this.name1,
    this.name2,
    this.name3,
    this.name4,
    this.name5,
    this.name6,
    this.name7,
    this.day,
  });


}
