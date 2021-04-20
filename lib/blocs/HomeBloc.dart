import 'package:flutter/cupertino.dart';
import 'package:keepapp/blocs/NotesBloc.dart';
import 'package:keepapp/model/NoteModel.dart';
import 'package:keepapp/utils/Api.dart' as Api;
import 'package:keepapp/utils/LocalDataStorage.dart';
import 'package:keepapp/utils/Utils.dart';

/// Bloc for [HomePage]
class HomeBloc extends ChangeNotifier {
  List<NoteModel> notesList;

  NotesBloc notesBloc;
  String token;
  String errorMsg;

  LocalDataStorage localDataStorage = LocalDataStorage();

  /// return notes list to UI
  bool getNotes() {
    Utils.showToast("Refreshing...");
    Api.getNotes().then((list) {
      if (list != null && list.isNotEmpty) {
        notesList = list;
        errorMsg = null;
      } else {
        errorMsg = "No data found!";
      }
      notifyListeners();
    }).catchError((error) {
      errorMsg = Utils.getErrorMessage(error);
      Utils.showToast(Utils.getErrorMessage(error));
      notifyListeners();
    });
  }

  /// add new note locally to UI
  void appendList() {
    notesList.insert(0, notesBloc.note);
    notifyListeners();
  }

  /// add new note locally to UI
  void deleteNote() {
    notesList.remove(notesBloc.note);
    notifyListeners();
  }
}
