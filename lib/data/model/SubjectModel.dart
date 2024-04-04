import 'dart:convert';



class SubjectsModel {

  final id;
  final name;

  SubjectsModel({

    this.id,
    this.name,
  });

  factory SubjectsModel.fromJson(Map<String, dynamic> json) => SubjectsModel(
    id: json['id'] ?? "2",
    name: json['name'] ?? "3",

  );

  Map<String, dynamic> toJson() => {
    "id": id.toJson(),
    "name": name.toJson(),

  };
}