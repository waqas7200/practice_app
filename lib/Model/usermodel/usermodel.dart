import 'package:flutter/material.dart';

class Usermodel {
 String id,name,email;
 DateTime createdAt;
 Usermodel(this.id,this.name,this.email,this.createdAt);

 Map<String ,dynamic>toMAp()=>{
  'id':id,
  'name':name,
  'email':email,
   'createdAt':createdAt.toString()
};
}