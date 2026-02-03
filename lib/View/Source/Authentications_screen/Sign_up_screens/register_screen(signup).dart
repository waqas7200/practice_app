import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:practice/View/Source/Home_screen/home_screen.dart';
import 'package:provider/provider.dart';

import '../../../../Controlleer/providers/My_auth_provider/my_auth_provider.dart';
import '../../../utills/route_helper/routes.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController name=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  GlobalKey<FormState> formkey=GlobalKey<FormState>();
  bool loading=false;
  FirebaseAuth auth=FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:   AppBar(
        title: Text('Welcome',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
        centerTitle: true,
      ),
      body:  loading?Center(child: CircularProgressIndicator(),): Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Image.asset('assets/logo.png',height: 100,),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30,right: 50,top: 15),
                child: TextFormField(
                  controller: name,
                  decoration: InputDecoration(
                    hintText: 'Enter Name',
                  ),
                  validator: (value) {
                    if(value==null || value.isEmpty){
                      return 'please enter name';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30,right: 50,top: 15),
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
                      return 'use alphabets,digits,and @';
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
                padding: const EdgeInsets.only(left: 30,right: 50,top: 10),
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
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Consumer<MyAuthProvider>(
                  builder: (context,provider,child) {
                    return provider.loading?Center(child: CircularProgressIndicator(),)
                        :ElevatedButton(onPressed: (){
                      if(formkey.currentState!.validate())
                      {
                        provider.signup(name.text,email.text,password.text);
                      }

                    },
                        child: Text('Register Now',style:
                        TextStyle(fontSize: 13,
                            fontWeight: FontWeight.bold),));
                  }
                ),
              ),
              //text==Already have an account
              Padding(
                padding: const EdgeInsets.only(left: 80,right: 50,top: 10),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account ",style: TextStyle(color:Colors.black )),
                    TextButton(
                      onPressed: (){
                        Navigator.pushNamed(context, Routes.login);
          
                      },
                      child: Text("Sign In",style: TextStyle(fontWeight: FontWeight.bold)),)
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

