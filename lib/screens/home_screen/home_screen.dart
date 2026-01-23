import 'package:flutter/material.dart';
import 'package:practice/provider/Setting_Theme_providder/theme_provider.dart';
import 'package:practice/provider/home_provider/home_provider.dart';
import 'package:practice/screens/settings_screen/settings_screen.dart';
import 'package:provider/provider.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home screen'),
      ),
      body:Column(
        children: [
          // Consumer<ThemeProvider>(
          //   builder: (context,Provider,child) {
          //     return DropdownButton<ThemeMode>(
          //       value :Provider.mode,
          //         onChanged: (value){
          //           Provider.switchmode(value!);
          //         },
          //     items: [
          //       DropdownMenuItem<ThemeMode>  (
          //         value: ThemeMode.system,
          //         child: Text('system'),
          //       ),
          //       DropdownMenuItem<ThemeMode>  (
          //         value: ThemeMode.light,
          //         child: Text('Light'),
          //       ),
          //       DropdownMenuItem<ThemeMode>  (
          //         value: ThemeMode.dark,
          //         child: Text('Dark'),
          //       ),
          //
          //       ],
          //     );
          //   }
          // ),

          Padding(
            padding: const EdgeInsets.only(left: 250),
            child: Consumer<ThemeProvider>(builder: (context,Provider,child){
              final isDark=Provider.mode==ThemeMode.dark;
              return TextButton.icon(onPressed: (){
                Provider.switchmode(
                  isDark?ThemeMode.light:ThemeMode.dark
                );
              } ,
              icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
                label: Text(isDark? 'Light ':'Dark '),
              );
            }),
          ),


          //one button textbutton theme change =========

          // Consumer<ThemeProvider>(
          //   builder: (context, provider, child) {
          //     final isDark = provider.mode == ThemeMode.dark;
          //     return TextButton.icon(
          //       onPressed: () {
          //         provider.switchmode(
          //           isDark ? ThemeMode.light : ThemeMode.dark,
          //         );
          //       },
          //       icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
          //       label: Text(isDark ? 'Light Mode' : 'Dark Mode'),
          //     );
          //   },
          // ),



          // on texbutton theme change=============

          // Consumer<ThemeProvider>(
          //   builder: (context, provider, child) {
          //     return Column(
          //       mainAxisSize: MainAxisSize.min,
          //       children: [
          //
          //         TextButton(
          //           onPressed: () {
          //             provider.switchmode(ThemeMode.light);
          //           },
          //           child: const Text('Light'),
          //         ),
          //         TextButton(
          //           onPressed: () {
          //             provider.switchmode(ThemeMode.dark);
          //           },
          //           child: const Text('Dark'),
          //         ),
          //       ],
          //     );
          //   },
          // ),

          Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Center(child: Consumer<HomeProvider>(
              builder: (context ,provider,child){
                return Text(provider.count.toString(),style: TextStyle(
                    fontWeight:FontWeight.bold,fontSize: 40),);
              },
            ),),
          ),
        ],
      ),
        floatingActionButton: FloatingActionButton(
            onPressed: (){
              Provider.of<HomeProvider>(context,listen:false).increment();
            },
            child: Icon(Icons.add),
        ),

    );
  }
}
