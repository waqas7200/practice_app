import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:practice/Model/usermodel/usermodel.dart';
import 'package:practice/View/utills/route_helper/routes.dart';
import 'package:practice/main.dart';

import '../../View/utills/scafold_massanger/scafold_massanger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyAuthProvider with ChangeNotifier{
  FirebaseAuth auth=FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;
  bool loading=false;

  //login_code===========
  void login(String email,String password)async{
    _loading(true);
    try{
      await auth.signInWithEmailAndPassword(
          email:email,
          password: password
      );
      Navigator.pushNamedAndRemoveUntil(navigatorkey.currentContext!,
          Routes.home, (value)=>false);
    }on FirebaseAuthException catch(e){
      showMsg(e.message);
    }
    catch(e){
      showMsg(e.toString());
    }finally{
      _loading(false);
  }
  }

  //signup_code==============
  void signup(String name,String email,String password)async{
    _loading(true);
    try{
     final result= await auth.createUserWithEmailAndPassword(
         email: email,
         password: password
     );
     Usermodel user=Usermodel(
         result.user!.uid,
         name,
         email,
         DateTime.now()
     );
     await db.collection('user').doc(result.user!.uid).set(user.toMAp());
     Navigator.pushNamedAndRemoveUntil(navigatorkey.currentContext!,
         Routes.home, (value)=>false);
    }catch(e){
      showMsg(e.toString());
    }finally{
      _loading(false);
    }
  }


  //forgetpassword_code=====================
  void forgetpassword(String email)async{
    _loading(true);
    try{

    }catch(e){
      showMsg(e.toString());
    }finally{
      _loading(false);
    }
  }

  //logout=================
  void logout()async{
    _loading(true);
    try{

    }catch(e){
      showMsg(e.toString());
    }finally{
      _loading(false);
    }
  }



  //loading function
  _loading(bool value){
     loading=value;
    notifyListeners();
  }
}