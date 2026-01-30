import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:practice/View/Source/Authentications_screen/Login_screen/login_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
FirebaseAuth auth=FirebaseAuth.instance;
class _HomeScreenState extends State<HomeScreen> {

  //logout function=====================
  void logout()async{
   try{
     await auth.signOut();
     Navigator.pushAndRemoveUntil(context,
         MaterialPageRoute(builder: (context)=>LoginScreen()),
         (value)=>false);
   }catch(e){
    ScaffoldMessenger.of(context)
        .showSnackBar(
      SnackBar(content: Text(e.toString()))
    ) ;
   }
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home screen'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Center(
          child: TextButton(
              onPressed: (){
                logout();
              },
              child: Text('Logout')),
        )
        ],
      ),
    );
  }
}
