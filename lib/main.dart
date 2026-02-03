
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:practice/Controlleer/providers/My_auth_provider/my_auth_provider.dart';
import 'package:practice/View/Source/splash_screen/splash_screen.dart';
import 'package:practice/View/utills/static_class_of_colors/static_colors.dart';
import 'package:provider/provider.dart';

import 'Controlleer/providers/note_provider/note_provider.dart';
import 'View/Source/Authentications_screen/Login_screen/login_screen.dart';
import 'View/utills/route_helper/routes.dart';
import 'firebase_options.dart';
final ScaffoldMessengerkey = GlobalKey<ScaffoldMessengerState>();
final navigatorkey=GlobalKey<NavigatorState>();

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
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context)=>MyAuthProvider()),
            ChangeNotifierProvider(create: (context)=>NoteProvider()),

          ],
        child: MaterialApp(
          theme: ThemeData(
              splashColor: Colors.black,
              textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.red
                  )
              ),
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                  backgroundColor: Colors.red.withOpacity(0.9),
                  foregroundColor: Colors.white
              ),
              cardTheme:CardThemeData(
                color: Colors.red.withOpacity(0.3),

              ) ,
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
          scaffoldMessengerKey:ScaffoldMessengerkey,
          navigatorKey: navigatorkey,
          debugShowCheckedModeBanner: false,

        ),
      );

  }
}

