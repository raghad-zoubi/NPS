import 'dart:convert';



class NotesModel {

  final semester;
  final id;
  final name;
  final text;
  final date;

  NotesModel({

    this.semester,
    this.id,
    this.name,
    this.text,
    this.date,
  });

  factory NotesModel.fromJson(Map<String, dynamic> json) => NotesModel(
    semester: json['semester'] ?? "2",
    text: json['text'] ?? "3",
    date: json['date'] ?? "4",
    name: json['name'] ?? "5",
    id: json['id'] ?? "6",

  );

  Map<String, dynamic> toJson() => {
    "semester": semester.toJson(),
    "text": text.toJson(),
    "date": date.toJson(),
    "name": name.toJson(),
    "id": id.toJson(),

  };
}
