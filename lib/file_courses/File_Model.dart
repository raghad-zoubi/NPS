import 'dart:convert';

import 'package:flutter/cupertino.dart';


class FileModel {

  var  id;
  var  subject_id;
  var  text;
  var  working_papers_type_id;
  // Icon  icon;
//  var  mygrade;
  var  title;


  FileModel(
      {required this.id,
        required   this.text,
        // this.mygrade,
        required  this.subject_id,
        required this.working_papers_type_id,
        required this.title,
        //  required this.icon,
      });

  factory FileModel.fromJson(Map<String, dynamic> json) => FileModel(

    working_papers_type_id: json['working_papers_type_id']??"2",
    // date: json['date']??"3",
    subject_id: json['subject_id']??"4",
    title: json['title']??"5",
    //  icon: json['icon']??"6",
    text: json['text']??"7",
    id: json['id']??"8",

  );

  Map<String, dynamic> toJson() => {
    "working_papers_type_id": working_papers_type_id,
    // "icon": icon,
    "title": title,
    // "date": date,
    "text": text,
    "id": id,
    "subject_id": subject_id,
  };
}

