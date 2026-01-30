
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:practice/Model/providers/my_auth_provider.dart';
import 'package:practice/View/Source/splash_screen/splash_screen.dart';
import 'package:practice/View/utills/static_class_of_colors/static_colors.dart';
import 'package:provider/provider.dart';

import 'View/Source/Authentications_screen/Login_screen/login_screen.dart';
import 'View/utills/route_helper/routes.dart';
import 'firebase_options.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return
      ChangeNotifierProvider<MyAuthProvider>(
      create:(context)=>MyAuthProvider(),
      child:MaterialApp(
        theme: ThemeData(
          splashColor: Colors.black,
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Appcolor.red,
                  foregroundColor: Appcolor.white,
                )
            )
        ),
          initialRoute: Routes.inital,
        routes: Routes.routes(),
        onGenerateRoute: (settings)=>Routes.onGenerateRoute(settings),
        debugShowCheckedModeBanner: false,

      )
    );
  }
}

