import 'package:flutter/material.dart';

class AddNoteModel {
  String? id,userid,title,desc;
  DateTime? createdAt;
  AddNoteModel(this .id,this.userid,this.title,this.desc,this.createdAt);
  factory AddNoteModel.fromMap(Map<String, dynamic>map)=>AddNoteModel(
     map['id'],
     map['user_id'],
     map['title'],
     map['desc'],
     DateTime.parse(map['created_at'],)

  );

  Map<String,dynamic> toMap()=>{
    'id':id,
    'title':title,
    'user_id':userid,
    'desc':desc,
    'created_at':createdAt.toString()
  };
}