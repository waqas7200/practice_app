
import 'package:flutter/material.dart';
import 'package:practice/provider/Setting_Theme_providder/theme_provider.dart';
import 'package:practice/provider/home_provider/home_provider.dart';
import 'package:practice/provider/home_provider/note_provider.dart';
import 'package:practice/screens/add_note_screen/add_note.dart';
import 'package:practice/screens/home_screen/Home_2.dart';
import 'package:practice/screens/home_screen/home_screen.dart';
import 'package:practice/screens/profile_screens/profile_screen.dart';
import 'package:practice/screens/settings_screen/settings_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiProvider(
    providers: [
    ChangeNotifierProvider(create: (context)=>HomeProvider(),),
    ChangeNotifierProvider(create: (context)=>HomeProvider2(),),
    ChangeNotifierProvider(create: (context)=>HomeProvider3(),),
    ],
    child: HomeScreen(),

    ),
    );
  }
}


// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//         create:(context)=>NoteProvider() ,
//     child: MaterialApp(
//       debugShowCheckedModeBanner: false,
//       routes: {
//         '/':(context)=>Home2(),
//         '/addnote':(context)=>AddNote(),
//       },
//     ),
//     );
//   }
// }





//==================================================
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider<ThemeProvider>(
//       create: (context) => ThemeProvider(),
//       child: Consumer<ThemeProvider>( // 🔥 TYPE ADDED HERE
//         builder: (context, provider, child) {
//           return MaterialApp(
//             debugShowCheckedModeBanner: false,
//             themeMode: provider.mode,
//             home: ChangeNotifierProvider(
//               create: (context) => HomeProvider(),
//               child: HomeScreen(),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }







//=======================================================
//theme controll code dak to light
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider<ThemeProvider>(
//         create: (context)=>ThemeProvider(),
//     child: Consumer<ThemeProvider>(
//         builder:(context ,provider,child){
//           return MaterialApp(
//             debugShowCheckedModeBanner: false,
//            themeMode: provider.mode,
//            darkTheme: ThemeData.dark(),
//
//           home: ChangeNotifierProvider(
//           create: (context)=>HomeProvider(),
//           child: HomeScreen(),
//           )
//           );
//         } )
//     );
//   }
// }

