// import 'dart:js';

import 'package:books_cafe/Model/Models.dart';
import 'package:books_cafe/UiDesign/Designs.dart';
import 'package:flutter/material.dart';

class StudentMyBooksActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getListWidget(),
    );
  }
}

Widget getListWidget() {
  var list = getBooksList();
  BookCardModel data;

  return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context,position) {
        data = list[position];
        return ListTile(
          title: Row(
            children: [
              Expanded(
                child: Text(data.name),
              ),
              Text(data.availableQuantity.toString()+"/"+data.totalQuantity.toString()),
            ],
          ),
          subtitle: Row(
            children: [
              Expanded(
                child: Text(data.publisher),
              ),
              Text(data.author),
            ],
          ),
          leading: RoundImage(),
          trailing: PopupMenu(),
        );
      }
  );
}

List getBooksList() {
  var model = new BookCardModel();
  model.name = "Book Name";
  model.totalQuantity = 10;
  model.availableQuantity = 7;
  model.publisher = "Pearson";
  model.author = "Smith";
  List<BookCardModel> list = [];
  list.add(model);
  list.add(model);
  list.add(model);
  list.add(model);
  return list;
}

class PopupMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(
        Icons.more_vert_rounded,
      ),
      itemBuilder: (context) => [
        PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.remove_circle),
            title: Text("remove from My Books"),
          ),
          value: 1,
        ),
        PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.download),
            title: Text("Download"),
          ),
          value: 2,
        ),
        PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.add_task),
            title: Text("Get Issue"),
          ),
          value: 3,
        ),
      ],
    );
  }
}
