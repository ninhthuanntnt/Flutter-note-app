import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keepapp/model/NoteModel.dart';
import 'package:keepapp/utils/Api.dart' as Api;
import 'package:keepapp/utils/Utils.dart';

class NotesBloc {
  NoteModel note;

  NotesBloc.empty() {
    note = NoteModel();
    note.colorValue = Colors.green.value;
  }

  // NoteModel selectedNote;
  String token;

  void addNote(BuildContext context) {
    note.title=note.title??'';
    note.description=note.description??'';
    
    Api.addNote(note).then((value) {
    }).catchError((error) {
      Utils.showToast(Utils.getErrorMessage(error));
    });
  }

  void update(BuildContext context) {
    note.title=note.title??'';
    note.description=note.description??'';

    Api.updateData(note).then((value) {
      }).catchError((error) {
        Utils.showToast(Utils.getErrorMessage(error));
      });

  }

  void delete(BuildContext context) {
      Api.deleteNote(note).then((value) {
      }).catchError((error) {
        Utils.showToast(Utils.getErrorMessage(error));
      });

  }
}
