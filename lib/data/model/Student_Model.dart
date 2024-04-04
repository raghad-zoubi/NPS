import 'dart:convert';


class StudentModel {

  final tid;
  final fname;
  final lastname;
  final sid;
  final grades;


  StudentModel(
      {this.tid,
      this.fname,
      this.grades,
      this.lastname,
      this.sid,
 });

  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(

         lastname: json['lastname']??"2",
        grades: json['grades']??"4",
        sid: json['sid']??"6",
        fname: json['fname']??"7",
        tid: json['tid']??"8",

      );

  Map<String, dynamic> toJson() => {
        "lastname": lastname.toJson(),
        "sid": sid,
        "fname": fname,
        "tid": tid,
        "grades": grades,
      };
}
