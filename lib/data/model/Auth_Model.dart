import 'dart:convert';


class AuthModel {


  final name;
  final message;
  final token;
  final statusCode;


  AuthModel(
      {
        this.name,
        this.statusCode,

        this.message,
        this.token,
      });

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(

    message: json['message']??"2",

    statusCode: json['statusCode']??"4",
    token: json['token']??"6",
    name: json['name']??"7",


  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "token": token,

    "name": name,
    "statusCode": statusCode,
  };
}
