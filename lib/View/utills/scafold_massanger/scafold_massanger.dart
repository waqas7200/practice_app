import 'package:flutter/material.dart';
import 'package:practice/main.dart';

 void showMsg(String? msg , [bool isError=true]){
 ScaffoldMessengerkey.currentState?.showSnackBar(
     SnackBar(content: Text(msg??''),

       backgroundColor: isError? Colors.red: Colors.green,
 )
 );
}