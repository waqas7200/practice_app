import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:practice/View/Source/Home_screen/home_screen.dart';
import 'package:practice/View/utills/route_helper/routes.dart';

import '../Authentications_screen/Login_screen/login_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FirebaseAuth auth=FirebaseAuth.instance;
  @override
  //init state function========
  void initState() {
    super.initState();
    nextScreen();
  }

  //nextscreen========================
  void nextScreen()async{
    await  Future.delayed(Duration(seconds: 3));
    if(auth.currentUser==null){
     if(mounted){
       Navigator.pushReplacementNamed(context,Routes.login);
     }
    }else{
      Navigator.pushReplacementNamed(context, Routes.home);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(child: Image.asset('assets/logo.png',height: 100,),),
    );
  }
}
