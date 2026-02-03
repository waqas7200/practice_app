import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice/Controlleer/providers/My_auth_provider/my_auth_provider.dart';
import 'package:practice/View/Source/Authentications_screen/Login_screen/login_screen.dart';
import 'package:practice/View/Source/add_note_screen/add_note.dart';
import 'package:practice/View/utills/route_helper/routes.dart';
import 'package:provider/provider.dart';

import '../../../Controlleer/providers/note_provider/note_provider.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
FirebaseAuth auth=FirebaseAuth.instance;
class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<NoteProvider>(context, listen: false).getnotes();
    super.initState();
  }

  //logout function=====================

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home screen'),
        centerTitle: true,
        actions: [
         IconButton(onPressed: (){
           showDialog(context: context,
               builder: (context ){
             return AlertDialog(
               title: Text('Logout',style: TextStyle(color: Colors.red,
                 fontWeight: FontWeight.bold
               ),
               ),
               content: Text('Are you sure you want to logout?'),
               actions: [
                 TextButton(onPressed: (){
                   Navigator.pop(context);

                 },
                 style: TextButton.styleFrom(
                   foregroundColor: Colors.blue
                 )
                 , child: Text('No')),

                 TextButton(onPressed: (){
                   Navigator.pop(context);
                   Provider.of<MyAuthProvider>(context,listen: false).logout();
                 }, child: Text('Yes')),
               ],
             );
               });
         }, 
             icon:Icon(Icons.logout))
        ],
      ),
      floatingActionButton:
      FloatingActionButton(onPressed: (){
        Navigator.pushNamed(context,Routes.addNote);
      },child: Icon(Icons.add),),
      body: Consumer<NoteProvider>(
        builder: (context,provider,child) {
          return provider.loading?Center(child: CircularProgressIndicator(),):
          ListView(
            children: [
              for(var note in provider.notes)
                Padding(
                  padding: const EdgeInsets.only(left:20,right: 20,top: 15),
                  child: Card(
                    child: ListTile(
                      onLongPress: (){
                        showDialog(context: context,
                            builder: (BuildContext context){
                              return AlertDialog(
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('Are you sure to want to delet it ?',
                                      style: TextStyle(fontWeight: FontWeight.bold),),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        TextButton(onPressed: (){
                                          Navigator.pop(context);
                                        },
                                            style: TextButton.styleFrom(

                                                foregroundColor: Colors.blue),
                                            child: Text('No',
                                              style: TextStyle(fontWeight: FontWeight.bold),)),

                                        TextButton(onPressed: (){
                                          provider.deletnote(note);
                                          Navigator.pop(context);
                                        }, child: Text('Yes',style:
                                        TextStyle(fontWeight: FontWeight.bold),)),
                                      ],
                                    ),


                                  ],
                                ),
                              );
                            });
                      },
                      onTap: (){

                      },
                      leading: Icon(CupertinoIcons.book_fill),
                      title: Text(note.title!),
                      subtitle: Text(note.desc!),
                      trailing: IconButton(onPressed: (){
                        Navigator.pushNamed(context, Routes.updatenote,arguments: note);
                      },
                          icon: Icon(Icons.edit)),
                    ),
                  ),
                )
            ],
          );
        }
      ),
    );
  }
}


// void logout()async{
//   try{
//     await auth.signOut();
//     Navigator.pushAndRemoveUntil(context,
//         MaterialPageRoute(builder: (context)=>LoginScreen()),
//             (value)=>false);
//   }catch(e){
//     ScaffoldMessenger.of(context)
//         .showSnackBar(
//         SnackBar(content: Text(e.toString()))
//     ) ;
//   }
// }