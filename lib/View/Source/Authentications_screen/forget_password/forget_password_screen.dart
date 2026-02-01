import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:practice/View/utills/static_class_of_colors/static_colors.dart';

import '../../../utills/route_helper/routes.dart';
class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController email=TextEditingController();
  GlobalKey<FormState>  formkey=GlobalKey<FormState>();

  FirebaseAuth auth=FirebaseAuth.instance;

  bool loading=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        title: Text('Forget Password',style: TextStyle(fontWeight: FontWeight.bold,
            fontSize: 20),),
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
                padding: const EdgeInsets.only(left: 30,right: 50,top: 100),
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
                      return 'please enter valid email';
                    }
                    if(!value.contains('gmail.com')){
                      return 'please enter valid email';
                    }
                    return null;
                  },
                ),
              ),
          
          
              //login button
              Padding(
                padding: const EdgeInsets.only(top: 50,left: 100),
                child: ElevatedButton(onPressed: (){
                  if(formkey.currentState!.validate())
                  {
          
                  }
          
                },
                    child: Text('Reset Password',style:
                    TextStyle(fontSize: 13,
                        fontWeight: FontWeight.bold),)),
              ),
          
            ],
          ),
        ),
      ),
    );
  }
}
