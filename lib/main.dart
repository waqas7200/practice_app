import 'package:flutter/material.dart';
import 'package:practice/home/home_screen.dart';
import 'package:practice/profile/profile_screen.dart';
import 'package:practice/settings_screens/settings_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
    // initialRoute:'/profile' ,
     routes: {
        '/':(contex)=>HomeScreen(),
        '/profile':(context)=>ProfileScreen(),
        '/setting':(context)=>SettingsScreen()
    },
    );
  }
}

