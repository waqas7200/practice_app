import 'package:flutter/material.dart';
import 'package:practice/Model/note_model/note_model.dart';
import 'package:practice/provider/home_provider/note_provider.dart';
import 'package:provider/provider.dart';
class AddNote extends StatelessWidget {
  const AddNote({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController addcontroller=TextEditingController();
    TextEditingController adddesc=TextEditingController();
    GlobalKey<FormState>form=GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Note'),
        centerTitle: true,

      ),
      body: Form(
        key: form,
        child: Padding(
          padding: const EdgeInsets.all(38.0),
          child: Column(
            spacing: 20,
            children: [
              TextFormField(
                controller: addcontroller,
                decoration: InputDecoration(
                  hintText: 'Add title'
                ),
                validator: (value){
              if(value==null || value.isEmpty){
                return "please enter title";
              }
              return null;
                },
              ),
              TextFormField(
                maxLines: 3,
                controller: adddesc,
                decoration: InputDecoration(
                  hintText: 'Add Description'
                ),
                validator: (value){
              if(value==null || value.isEmpty){
                return "please enter Description";
              }
              return null;
                },
              ),
              ElevatedButton(
                  onPressed: (){
                    if(form.currentState!.validate()){
                     NoteModel note=NoteModel(
                       addcontroller.text,
                         adddesc.text,
                     );
                     Provider.of<NoteProvider>(context,listen: false).AddNote(note);
                   Navigator.pop(context);
                    }
                  },
                  child: Text('Save Notes')
              )
            ],
          ),
        ),
      ),
    );
  }
}
