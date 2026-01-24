import 'package:flutter/material.dart';
import 'package:practice/Model/note_model/note_model.dart';
import 'package:practice/provider/home_provider/note_provider.dart';
import 'package:provider/provider.dart';
class Home2 extends StatelessWidget {
  const Home2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
    title: Text('My Notes'),
  ),
      body: Consumer<NoteProvider>(
        builder: (context,provider,child) {
          return provider.note.isEmpty?Center(child:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Icon(Icons.my_library_books),
            Text('No Data Avalibale')
          ],) ,)
              : ListView(
            children: [
              for(NoteModel note in provider.note)
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: Card(
                   shadowColor: Colors.blue.shade900.withOpacity(0.2),
                    surfaceTintColor: Colors.blue,
                    child: ListTile(
                      title: Text(note.title),
                      subtitle: Text(note.decs),
                      trailing: IconButton(onPressed: (){
                      provider.Deletenote(note);
                      },
                          icon:Icon(Icons.delete,color: Colors.red,), )
                    ),
                  ),
                )
            ],
          );
        }
      ),

      floatingActionButton: FloatingActionButton
        (
          onPressed: (){
            Navigator.pushNamed(context, '/addnote');
          },
          child: Icon(Icons.add),
      ),
    );
  }
}
