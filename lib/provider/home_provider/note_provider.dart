import 'package:flutter/material.dart';
import 'package:practice/Model/note_model/note_model.dart';
class NoteProvider with ChangeNotifier
{
  List <NoteModel>note=[];
  void AddNote(NoteModel newnote){
    note.add(newnote);
    notifyListeners();
    }
  void Deletenote(NoteModel newnote){
    note.remove(newnote);
    notifyListeners();
  }
}