
import 'dart:convert';
//
// List<PermanenceModel> postmodelFromJson(String str) => List<PermanenceModel>.from(json.decode(str).map((x) => PermanenceModel.fromJson(x)));
//
// String postmodelToJson(List<PermanenceModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class   PermanenceModel {
//   PermanenceModel({
//       this.id='4',
//     required  this.allCount,
//     //required  this.date,
//     required  this.UnexcusedCount,
//     required  this.excusedCount,
//       this.days="6",
//
//   });
//
//
//   String id;
//   String allCount;
//  // String date;
//   String UnexcusedCount;
//   String excusedCount;
//   var days;
//
//
//   factory PermanenceModel.fromJson(Map<String, dynamic> json) => PermanenceModel(
//     id: json["id"]?? "1",
//     allCount: json["allCount"]?? "2",
//   //  date: json["date"]?? "3",
//     UnexcusedCount: json["UnexcusedCount"]?? "4",
//     excusedCount: json["excusedCount"]?? "5",
//     days: json["days"]?? "6",
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "allCount": allCount,
//    // "date": date,
//     "UnexcusedCount": UnexcusedCount,
//     "excusedCount": excusedCount,
//     "days": days,
//   };
// }
//////////////////////////////////
class PermanenceModel {
  int? excusedCount;
  int? unexcusedCount;
  int? allCount;
  int? allDay;
  int? statusCode;

  PermanenceModel(
      {this.excusedCount,this.allDay, this.unexcusedCount, this.allCount, this.statusCode});

  PermanenceModel.fromJson(Map<String, dynamic> json) {
    excusedCount = json['excusedCount'];
    unexcusedCount = json['UnexcusedCount'];
    allCount = json['allCount'];
    statusCode = json['statusCode'];
    allDay = json['allDay'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['excusedCount'] = this.excusedCount;
    data['UnexcusedCount'] = this.unexcusedCount;
    data['allCount'] = this.allCount;
    data['statusCode'] = this.statusCode;
    data['allDay'] = this.allDay;
    return data;
  }
}