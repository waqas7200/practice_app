import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:practice/View/Source/Home_screen/home_screen.dart';

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

  void login()async{
    setState(() {
      loading=true;
    });try{
      await auth.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(
          builder: (context)=>HomeScreen()),
          (value)=>false,
      );
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString()))
      );
    }finally{
      setState(() {
        loading=false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:   AppBar(
        title: Text('Welcome',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
        centerTitle: true,
      ),
      body:  loading?Center(child: CircularProgressIndicator(),): Form(
        key: formkey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Image.asset('logo.png',height: 100,),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 50,top: 20),
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
              padding: const EdgeInsets.only(top: 50),
              child: ElevatedButton(onPressed: (){
                if(formkey.currentState!.validate())
                {
                  login();
                }

              },
                  child: Text('Register Now',style:
                  TextStyle(fontSize: 13,
                      fontWeight: FontWeight.bold),)),
            ),
            //text==Already have an account
            Padding(
              padding: const EdgeInsets.only(left: 140,right: 50,top: 20),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account ",style: TextStyle(color:Colors.black )),
                  TextButton(
                    onPressed: (){
                      Navigator.pushReplacementNamed(context, Routes.login);

                    },
                    child: Text("Sign In",style: TextStyle(fontWeight: FontWeight.bold)),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

