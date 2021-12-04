import 'package:books_cafe/Model/Models.dart';
import 'package:books_cafe/Ui/Common/BooksDetail.dart';
import 'package:books_cafe/UiDesign/Designs.dart';
import 'package:flutter/material.dart';

import '../../Constants.dart';

class InstituteBooksActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BooksDetail(ADDABLE_BUTTON)),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
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
              MaterialPageRoute(builder: (context) => BooksDetail(NO_BUTTON)),
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
            title: Text("Remove"),
          ),
          value: 1,
        ),
        // PopupMenuItem(
        //   child: ListTile(
        //     leading: Icon(Icons.remove_circle),
        //     title: Text("Download"),
        //     subtitle: Text("10.39 Mb"),
        //   ),
        //   value: 2,
        // ),
        // PopupMenuItem(
        //   child: ListTile(
        //     leading: Icon(Icons.add_task),
        //     title: Text("Get Issue"),
        //   ),
        //   value: 3,
        // ),
      ],
    );
  }
}
