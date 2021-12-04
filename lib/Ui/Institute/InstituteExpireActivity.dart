// import 'dart:js';

import 'package:books_cafe/Model/Models.dart';
import 'package:books_cafe/UiDesign/Designs.dart';
import 'package:flutter/material.dart';

class InstituteExpireActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getListWidget(),
    );
  }
}

Widget getListWidget() {
  var list = getExpireList();
  ExpireListModel data;

  return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, position) {
        data = list[position];
        return ListTile(
          title: Row(
            children: [
              Expanded(
                child: Text(data.bookName),
              ),
              Text(
                data.dateOfExpire,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
          subtitle: Row(
            children: [
              Expanded(
                child: Text(data.studentName),
              ),
              Text(data.studentRegistrationNumber),
            ],
          ),
          leading: RoundImage(),
          trailing: PopupMenu(),
        );
      });
}

List getExpireList() {
  var model = new ExpireListModel();
  model.bookName = "BookName";
  model.studentName = "Student Name";
  model.studentRegistrationNumber = "19105126908";
  model.dateOfExpire = "10/12/2021";
  List<ExpireListModel> list = [];
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
            leading: Icon(Icons.notifications),
            title: Text("Expire Notice"),
          ),
          value: 1,
        ),
        // PopupMenuItem(
        //   child: ListTile(
        //     leading: Icon(Icons.cancel),
        //     title: Text("Cancle"),
        //   ),
        //   value: 2,
        // ),
      ],
    );
  }
}
