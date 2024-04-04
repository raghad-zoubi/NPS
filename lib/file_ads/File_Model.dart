
import 'dart:convert';

import 'package:flutter/cupertino.dart';


class FileModel {

  var  id;
  var  text;
  var  type;
  var  title;
  var  updated_at;


  FileModel(
      {required this.id,
        required   this.text,
        required this.type,
        required this.title,
        required this.updated_at,
        //  required this.icon,
      });

  factory FileModel.fromJson(Map<String, dynamic> json) => FileModel(

    type: json['type']??"2",
    title: json['title']??"5",
    text: json['text']??"7",
    id: json['id']??"8",
    updated_at: json['updated_at']??"8",


  );

  Map<String, dynamic> toJson() => {
    "type": type,
    // "icon": icon,
    "title": title,
    "updated_at": updated_at,
    "text": text,
    "id": id,

  };
}
