import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:practice/View/utills/static_class_of_colors/static_colors.dart';

import '../../../utills/route_helper/routes.dart';
import '../../Home_screen/home_screen.dart';
import '../Sign_up_screens/register_screen(signup).dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  GlobalKey<FormState>  formkey=GlobalKey<FormState>();

  FirebaseAuth auth=FirebaseAuth.instance;

  bool loading=false;
  void registerNow() async{
    setState(() {
      loading=true;
    });
    try{
      await auth.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      Navigator.pushReplacementNamed(context, Routes.signup);
    }catch(e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(
          SnackBar(content: Text(e.toString()))
      );
    }finally{
      loading=false;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.main,
      appBar: AppBar(
        backgroundColor: Appcolor.main.withOpacity(0.3),
        title: Text('Welcome back',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
        centerTitle: true,
      ),
      body:loading?Center(child: CircularProgressIndicator(),): Form(
        key: formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(child: Image.asset('logo.png',height: 100,)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 0,top: 20),
              child: Text('Login Here',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                color: Colors.blue
              ),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 50,top: 20),
              child: TextFormField(
                controller: email,
                decoration: InputDecoration(
                  hintText: 'Enter Email',
                ),
                validator: (value) {
                  if(value==null || value.isEmpty){
                    return 'please enter email';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 50,top: 20),
              child: TextFormField(
                controller: password,
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
                validator: (value) {
                  if(value==null || value.isEmpty){
                    return 'please enter pasword';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50,left: 170),
              child: ElevatedButton(onPressed: (){
                if(formkey.currentState!.validate())
                {
                  registerNow();
                }

              },
                  child: Text('Login Now',style:
                  TextStyle(fontSize: 13,
                      fontWeight: FontWeight.bold),)),
            ),


            //text==dont have an account
            Padding(
              padding: const EdgeInsets.only(left: 140,right: 50,top: 20),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("don't have an account ",style: TextStyle(color:Colors.black )),
                  TextButton(
                    onPressed: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>RegisterScreen()),
                           );
                    },
                    child: Text("Sign up",style: TextStyle(fontWeight: FontWeight.bold),),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


