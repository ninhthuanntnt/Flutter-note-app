import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:keepapp/blocs/HomeBloc.dart';
import 'package:keepapp/blocs/NotesBloc.dart';
import 'package:keepapp/callbacks/ClickCallback.dart';
import 'package:keepapp/model/NoteModel.dart';
import 'package:keepapp/utils/Device.dart';
import 'package:keepapp/widgets/ItemWidget.dart';
import 'package:provider/provider.dart';

/// Note List UI
class NoteList extends StatefulWidget {
  ClickCallback onSelect;

  NoteList({this.onSelect});

  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  TextEditingController descriptionController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  HomeBloc homeBloc;
  int diff;
  Device device;
  Timer timer;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    device = Device(
        MediaQuery.of(context).size.height, MediaQuery.of(context).size.width);

    homeBloc = Provider.of<HomeBloc>(context);
    diff = device.deviceWidth.round() - device.deviceHeight.round();

    return getStaggeredView();
  }

  /// Note List in Staggered View
  Widget getStaggeredView() {
    return Container(
      child: LayoutBuilder(builder: (context, snapshot) {
        return StaggeredGridView.countBuilder(
          crossAxisCount: getCrossAxisCount(),
          staggeredTileBuilder: (int index) {
            int vertical = 2;
            if (homeBloc.notesList[index].description != null &&
                '\n'.allMatches(homeBloc.notesList[index].description).length >
                    5) {
              vertical = 3;
            }
            return StaggeredTile.count(2, vertical);
          },
          itemCount: homeBloc.notesList.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                selectCard(homeBloc.notesList[index], index);
              },
              child: ItemWidget(homeBloc.notesList[index], device),
            );
          },
        );
      }),
    );
  }

  /// Note List in List View
  Widget getListView() {
    return Container(
      height: device.deviceHeight,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => selectCard(homeBloc.notesList[index], index),
            child: ItemWidget(homeBloc.notesList[index], device),
            key: ObjectKey(homeBloc.notesList[index]),
          );
        },
        itemCount: homeBloc.notesList.length,
      ),
    );
  }

  /// Opens a new note or existing note if [noteModel] isNotEmpty
  void selectCard(NoteModel noteModel, int index) {
    if (homeBloc.notesBloc == null) homeBloc.notesBloc = NotesBloc.empty();
    noteModel.itemIndex = index;
    homeBloc.notesBloc.note = noteModel;
    widget.onSelect(null, null, true);
  }

  /// CrossAxisCount depends on screen size
  int getCrossAxisCount() {
    if (diff < -100) {
      return 4;
    } else if (diff > -100 && diff <= 200) {
      return 6;
    } else if (diff < 600) {
      return 8;
    } else if (diff < 1000) {
      return 10;
    }
    return 4;
  }
}
