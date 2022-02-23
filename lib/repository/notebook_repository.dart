import 'package:notebook_app/database/database_helper.dart';
import 'package:notebook_app/models/notebook.dart';


class NoteBookRepository{
   Future<int> addNote(NoteBook noteBook) async{
     return DatabaseHelper().addNote(noteBook);
   }

   Future<List<NoteBook>> getNoteList() async{
     return await DatabaseHelper().getNoteList();
   }

   Future<int> deleteNote(int id) async{
     return await DatabaseHelper().deleteNote(id);
   }

    Future<int> updateNote(NoteBook noteBook) async{
      return await DatabaseHelper().updateNote(noteBook);
    }

   Future<int> deleteTable(String tableName) async{
     return await DatabaseHelper().deleteTable(tableName);
   }
}