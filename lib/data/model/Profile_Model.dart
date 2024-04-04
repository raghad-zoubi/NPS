import 'dart:convert';



class ProfileModel {
  final tid;
  final fname;
  final lname;
  final mdesc;
  final img;
  final mname;

  ProfileModel({
    this.tid,
    this.fname,
    this.mname,
    this.img,
    this.lname,
    this.mdesc,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        lname: json['lname'] ?? "2",
        img: json['img'] ?? "4",
        mname: json['mname'] ?? "5",
        mdesc: json['mdesc'] ?? "6",
        fname: json['fname'] ?? "7",
        tid: json['tid'] ?? "8",
      );

  Map<String, dynamic> toJson() => {
        "lname": lname.toJson(),
        "mdesc": mdesc,
        "mname": mname,
        "fname": fname,
        "tid": tid,
        "img": img,
      };
}
