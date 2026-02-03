import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:practice/Model/addnote_model/add_note_model.dart';
import 'package:practice/View/utills/scafold_massanger/scafold_massanger.dart';
import 'package:practice/main.dart';
class NoteProvider with ChangeNotifier {

  List<AddNoteModel>notes=[];
  bool loading=false;
  FirebaseFirestore db=FirebaseFirestore.instance;
  FirebaseAuth auth=FirebaseAuth.instance;
  //String uid=FirebaseAuth.instance.currentUser!.uid;


  void getnotes()async{
    notes.clear();
    _loading(true);
    String uid=auth.currentUser!.uid;
    try{
     final result=await db.collection('user').doc(uid).collection('note').get();
     for(var doc in result.docs){
       AddNoteModel note=AddNoteModel.fromMap(doc.data());
       notes.add(note);
     }
     notifyListeners();

    }on FirebaseException catch(e){
      showMsg(e.toString());
    }
    catch(e){
      showMsg(e.toString());
    }finally{
      _loading(false);
    }

  }

  void addNote(String title,String desc)async{
    _loading(true);
    String id=DateTime.now().microsecond.toString();
    String uid=auth.currentUser!.uid;
    try{
     AddNoteModel note=AddNoteModel(id, auth.currentUser!.uid,
         title, desc, DateTime.now());
     await db.collection('user').doc(uid).collection('note').doc(id).set(note.toMap());
    getnotes();
     Navigator.pop(navigatorkey.currentContext!);
    }on FirebaseException catch(e){
      showMsg(e.toString());
    }
    catch(e){
      showMsg(e.toString());
    }finally{
      _loading(false);
    }
  }

  void updatenote(String title,String desc,String? noteId)async{
    _loading(true);
    String uid = auth.currentUser!.uid;
    try{
   await db.collection('user').doc(uid).collection('note').doc(noteId).update({
     'title':title,
     'desc':desc
   });
   getnotes();
   Navigator.pop(navigatorkey.currentContext!);
    }on FirebaseException catch(e){
      showMsg(e.toString());
    }
    catch(e){
      showMsg(e.toString());
    }finally{
      _loading(false);
    }

  }
  void deletnote(AddNoteModel note)async{
    _loading(true);
    String uid = auth.currentUser!.uid;
    try{

    await db
        .collection('user')
        .doc(uid)
        .collection('note')
        .doc(note.id) // 🔥 note ka id
        .delete();
  getnotes();
    }on FirebaseException catch(e){
      showMsg(e.toString());
    }
    catch(e){
      showMsg(e.toString());
    }finally{
      _loading(false);
    }

  }



  _loading(bool value)
  {
    loading=value;
    notifyListeners();
  }

}