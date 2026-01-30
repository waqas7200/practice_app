import 'package:flutter/material.dart';

import '../../Source/Authentications_screen/Login_screen/login_screen.dart';
import '../../Source/Authentications_screen/Sign_up_screens/register_screen(signup).dart';
import '../../Source/Authentications_screen/forget_password/forget_password_screen.dart';
import '../../Source/Home_screen/home_screen.dart';
import '../../Source/add_note_screen/add_note.dart';
import '../../Source/splash_screen/splash_screen.dart';
import '../../Source/update_note_screen/update_screen.dart';
class Routes {
  static String inital='/';
  static String login='/login';
  static String signup='/signup';
  static String forget_oassword='/forget';
  static String home='/home';
  static String addNote='/AddNote';
  static String updatenote='/updateNote';

  static Map<String ,WidgetBuilder>routes()=>{
    inital:(context)=>SplashScreen(),
    login:(context)=>LoginScreen(),
    signup:(context)=>RegisterScreen(),
    forget_oassword:(context)=>ForgetPasswordScreen(),
    home:(context)=>HomeScreen(),
    addNote:(context)=>AddNote(),
    //updatenote:(context)=>UpdateScreen(),
  };
  static onGenerateRoute(RouteSettings settings){
    final arug=settings.arguments;
    return MaterialPageRoute(builder: (context)=>UpdateScreen());
  }
}