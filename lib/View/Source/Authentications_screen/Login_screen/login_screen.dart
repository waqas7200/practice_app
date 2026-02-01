import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:practice/Model/providers/my_auth_provider.dart';
import 'package:practice/View/utills/static_class_of_colors/static_colors.dart';
import 'package:provider/provider.dart';

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
  // void registerNow() async{
  //   setState(() {
  //     loading=true;
  //   });
  //   try{
  //     await auth.signInWithEmailAndPassword(
  //       email: email.text,
  //       password: password.text,
  //     );
  //
  //   }catch(e) {
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(
  //         SnackBar(content: Text(e.toString()))
  //     );
  //   }finally{
  //     loading=false;
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        title: Text('Welcome back',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
        centerTitle: true,
      ),
      body:loading?Center(child: CircularProgressIndicator(),): Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Center(child: Image.asset('assets/logo.png',height: 130,)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30,right: 0,top: 20),
                child: Text('Login Here',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  color: Colors.red
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
                    if(!value.contains('@')){
                      return 'use alphabets,digits,and @l';
                    }
                    if(!RegExp(r'[0-9]').hasMatch(value)){
                      return 'use alphabets,digits,and @ ';
                    }
                    if(!value.contains('gmail.com')){
                      return 'enter gmail.com';
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
                    if(!RegExp(r'[0-9]').hasMatch(value)){
                      return 'please use numbers for strong password';
                    }
                    return null;
                  },
                ),
              ),
              //forgetpassword textbutton
              Padding(
                padding: const EdgeInsets.only(left: 200,right: 0,top: 10),
                child: TextButton(
                  onPressed: (){
                    Navigator.pushNamed(context, Routes.forget_oassword);
                  },
                  child: Text("forget password?",style: TextStyle(fontWeight: FontWeight.bold),),),
              ),
          
              //login button
              Consumer<MyAuthProvider>(
                builder: (context,provider,child) {
                  return provider.loading?Center(child: CircularProgressIndicator(),)
                      :
                  Padding(
                    padding: const EdgeInsets.only(top: 20,left: 120),
                    child: ElevatedButton(onPressed: (){
                      if(formkey.currentState!.validate())
                      {
                    provider.login(email.text, password.text);
                      }
          
                    },
                        child: Text('Login Now',style:
                        TextStyle(fontSize: 13,
                            fontWeight: FontWeight.bold),)),
                  );
                }
              ),
          
          
              //text==dont have an account
              Padding(
                padding: const EdgeInsets.only(left: 80,right: 50,top: 20),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account ",),
                    TextButton(
                      onPressed: (){
                        Navigator.pushNamed(context, Routes.signup);
                      },
                      child: Text("Sign up",style: TextStyle(fontWeight: FontWeight.bold),),)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


