import 'package:flutter/material.dart';
import 'package:practice/settings_screens/settings_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home screen'),
      ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 20,
          children: [
            Center(child: ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/profile');
                },
                child: Text('go to profile')),),
            Center(child: ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/setting');
                 // Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingsScreen()));
                },
                child: Text('go to setting')),),
          ],
        ),
    );
  }
}
