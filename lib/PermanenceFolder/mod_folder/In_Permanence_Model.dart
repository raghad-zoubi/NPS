
import 'dart:convert';

List<InPermanenceModel> postmodelFromJson(String str) => List<InPermanenceModel>.from(json.decode(str).map((x) => InPermanenceModel.fromJson(x)));

String postmodelToJson(List<InPermanenceModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class   InPermanenceModel {
  InPermanenceModel({
    required  this.id,
    required  this.semester,
    required  this.date,
    required  this.reason,
    required  this.time,
    required  this.day,
    required  this.person,

  });


  int id;
  String semester;
  String date;
  String reason;
  String time;
  String day;
  String person;


  factory InPermanenceModel.fromJson(Map<String, dynamic> json) => InPermanenceModel(
    id: json["id"]?? "1",
    semester: json["semester"]?? "2",
    date: json["date"]?? "3",
    reason: json["reason"]?? "4",
    time: json["time"]?? "5",
    day: json["day"]?? "6",
    person: json["person"]?? "7",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "semester": semester,
    "date": date,
    "reason": reason,
    "time": time,
    "day": day,
    "person": person,
  };
}