// import 'dart:js';

import 'package:books_cafe/Model/Models.dart';
import 'package:books_cafe/Ui/Common/BooksDetail.dart';
import 'package:books_cafe/UiDesign/Designs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Constants.dart';

var _issueDate = "Select Date";

class StudentLibraryActivity extends StatefulWidget {
  @override
  State<StudentLibraryActivity> createState() => _StudentLibraryActivityState();
}

class _StudentLibraryActivityState extends State<StudentLibraryActivity> {
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
      itemBuilder: (context, position) {
        data = list[position];
        return ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BooksDetail(READ_ONLY)),
            );
          },
          title: Row(
            children: [
              Expanded(
                child: Text(data.name),
              ),
              Text(data.availableQuantity.toString() +
                  "/" +
                  data.totalQuantity.toString()),
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
      });
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

class PopupMenu extends StatefulWidget {
  @override
  State<PopupMenu> createState() => _PopupMenuState();
}

class _PopupMenuState extends State<PopupMenu> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(
        Icons.more_vert_rounded,
      ),
      itemBuilder: (context) => [
        PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.add_circle),
            title: Text("Add to My Books"),
          ),
          value: 1,
        ),
        PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.download),
            title: Text("Download"),
            subtitle: Text("10.39 Mb"),
          ),
          value: 2,
        ),
        PopupMenuItem(
          child: ListTile(
            onTap: () {
              Navigator.pop(context);
              showDialog(
                  context: context,
                  builder: (dialogContext) {
                    return IssueDateDialog(dialogContext);
                  });
            },
            leading: Icon(Icons.add_task),
            title: Text("Get Issue"),
          ),
          value: 3,
        ),
      ],
    );
  }
}

class IssueDateDialog extends StatefulWidget {
  BuildContext dialogContext;

  IssueDateDialog(this.dialogContext);

  @override
  State<IssueDateDialog> createState() => _IssueDateDialogState(dialogContext);
}

class _IssueDateDialogState extends State<IssueDateDialog> {
  BuildContext dialogContext;

  _IssueDateDialogState(this.dialogContext);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Dialog(
        elevation: 15,
        child: Container(
          padding: EdgeInsets.all(25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2030),
                  ).then((value) {
                    if (value == null) {
                      setState(() {
                        _issueDate = "null";
                      });
                    }
                    setState(() {
                      _issueDate = value.toString();
                    });
                  });
                },
                child: TextFieldWithOutlinedBorder.Disable("Pick Date", Icon(Icons.date_range), _issueDate, false),
              ),
              ElevatedButtonBack.withAction("Confirm",() {Navigator.pop(dialogContext);}),
            ],
          ),
        ),
      ),
    );
  }
}
