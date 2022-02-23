import 'package:flutter/cupertino.dart';
import 'package:notebook_app/models/notebook.dart';
import 'package:notebook_app/repository/notebook_repository.dart';

class NoteBookProvider with ChangeNotifier{
  bool? _isLoading;
  List<NoteBook> _notebooklist =[];
  NoteBook? _noteBook;


  Future<String> addNote(NoteBook noteBook) async{

    String status = "loading";
    isLoading =true;
    notifyListeners();
    int content = await NoteBookRepository().addNote(noteBook);
    if (content == 1){
      status = "success" ;
    }else {
      status = "error";
    }
    isLoading = false;
    notifyListeners();
    return status;
  }

  Future<void> getNoteList() async{
    isLoading =true;
    notifyListeners();
    _notebooklist = await NoteBookRepository().getNoteList();
    isLoading = false;
    notifyListeners();
  }

  Future<String> deleteNote(int id) async{
    String status = "loading";
    isLoading =true;
    notifyListeners();
    int content = await NoteBookRepository().deleteNote(id);
    if (content == 1){
      status = "success" ;
    }else {
      status = "error";
    }
    isLoading = false;
    notifyListeners();
    return status;
  }




  Future<String> updateNote(NoteBook noteBook) async{

    String status = "loading";
    isLoading =true;
    notifyListeners();
    int content = await NoteBookRepository().updateNote(noteBook);
    if (content == 1){
      status = "success" ;
    }else {
      status = "error";
    }
    isLoading = false;
    notifyListeners();
    return status;
  }

  Future<String> deleteTable(String tableName) async{
    String status = "loading";
    isLoading =true;
    notifyListeners();
    int content = await NoteBookRepository().deleteTable(tableName);
    if (content == 1){
      status = "success" ;
    }else {
      status = "error";
    }
    isLoading = false;
    notifyListeners();
    return status;
  }



  bool get isLoading => _isLoading!;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }


  set notebooklist(List<NoteBook> value) {
    _notebooklist = value;
    notifyListeners();
  }

  List<NoteBook> get notebooklist => _notebooklist;

  NoteBook get noteBook => _noteBook!;

}