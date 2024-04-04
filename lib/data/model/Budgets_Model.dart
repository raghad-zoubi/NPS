// import 'dart:convert';
//
//
// class BudgetsModel {
//   BudgetsModel({
//     this.id,
//     this.still,
//     this.lastupde,
//     required List<PremiumModel> premiums,
//   });
//
//   final id;
//   final still;
//   final lastupde;
//
//   var  premiums=<PremiumModel>[];
//
//
//
//
//   factory BudgetsModel.fromJson(Map<String, dynamic> json) => BudgetsModel(
//     id: json["id"]??'999',
//     premiums : (json['premiums'] as List)
//         .map((data) => PremiumModel.fromJson(data))
//         .toList(),
//    // pay: json['pay'] ?? "2",
//     still: json['still'] ?? "3",
//     lastupde: json['lastupde'] ?? "4",
//
//
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "still": still.toJson(),
//     "lastupde": lastupde.toJson(),
//     "premiums":premiums.map((premiums) => premiums.payment).toList(),
//
//   };
// }
//
//
// class   PremiumModel {
//   PremiumModel({
//     this.id,
//     this.payment,
//     this.date,
//   });
//
//   var id;
//   var payment;
//   var date;
//
//   factory PremiumModel.fromJson(Map<String, dynamic> json) => PremiumModel(
//     id: json["id"],
//     payment: json["payment"],
//     date: json["date"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "payment": payment,
//     "date": date,
//   };
// }
//

import 'dart:ffi';

class BudgetsModel {
  int? total;
  int? sum;
  int? still;
  double? percent = 0.0;
  List<Premiums_Model>? premiums;

  BudgetsModel({this.total, this.sum, this.premiums, this.still, this.percent});

  BudgetsModel.fromJson(Map<String, dynamic> json) {
    // total = json['total']?? 0;
    // sum = json['sum']??0;
    // still = json['still']??0;
    if (json['premiums'] != null) {
      premiums = <Premiums_Model>[];
      json['premiums'].forEach((v) {
        premiums!.add(Premiums_Model.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['still'] = this.still;
    data['sum'] = this.sum;
    if (this.premiums != null) {
      data['premiums'] = this.premiums!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Premiums_Model {
  String? id;
  String? payment;
  String? date;
  String? studentsId;
  String? updatedAt;

  Premiums_Model(
      {this.id, this.payment, this.date, this.studentsId, this.updatedAt});

  Premiums_Model.fromJson(Map<String, dynamic> json) {
    id = json['id']??'1';
    payment = json['payment']??'2';
    date = json['date']??'3';
    studentsId = json['students_id']??'4';
    updatedAt = json['updated_at']??'5';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['payment'] = this.payment;
    data['date'] = this.date;
    data['students_id'] = this.studentsId;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
