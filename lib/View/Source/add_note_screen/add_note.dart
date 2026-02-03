import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Controlleer/providers/note_provider/note_provider.dart';
class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  TextEditingController title=TextEditingController();
  TextEditingController desc=TextEditingController();
  GlobalKey<FormState> formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add-Notes'),
        centerTitle: true,
      ),
      body: Form(
        key: formkey,
        child: ListView(
          padding: EdgeInsets.all(35),
          children: [
            TextFormField(
              controller: title,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Title'
              ),
              validator: (value){
                if(value==null || value.isEmpty){
                  return 'please enter title';
                }
                return null;
              },
            ),
            SizedBox(height: 20,),
            TextFormField(
              maxLines: 5,
              controller: desc,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Description'
              ),
              validator: (value){
                if(value==null || value.isEmpty){
                  return 'please enter description';
                }
                return null;
              },
            ),
            SizedBox(height: 30,),
           Padding(
             padding: const EdgeInsets.only(top: 20,left: 0),
             child: Consumer<NoteProvider>(
               builder: (context,provider,child) {
                 return provider.loading?Center(child: CircularProgressIndicator(),)
                     :ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(0,50)
                  ),
                  onPressed: (){
                    if(formkey.currentState!.validate())
                    {

                    }
                     provider.addNote(title.text, desc.text);
                    },
                  child: Text('Save note ',style:
                  TextStyle(fontSize: 13,
                      fontWeight: FontWeight.bold),));
               }
             ),
                   )
          ],
        ),
      ),
    );
  }
}
