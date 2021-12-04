// import 'dart:js';

import 'package:books_cafe/Model/Models.dart';
import 'package:books_cafe/UiDesign/Designs.dart';
import 'package:flutter/material.dart';

class StudentMyNotificationActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getListWidget(),
    );
  }
}

Widget getListWidget() {
  var list = getNotificationList();
  NotificationsModel data;

  return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, position) {
        data = list[position];
        return ListTile(
          title: Row(
            children: [
              Expanded(
                child: Text(data.subject),
              ),
              Text(
                data.time,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
          subtitle: Text(data.description),
          leading: Icon(
            Icons.notifications,
          ),
          trailing: PopupMenu(),
        );
      });
}

List getNotificationList() {
  var model = new NotificationsModel();
  model.subject = "Notification";
  model.description = "Description of Notification";
  model.time = "10:36 pm";
  List<NotificationsModel> list = [];
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
            leading: Icon(Icons.star_outline),
            title: Text("Star marked"),
          ),
          value: 1,
        ),
        PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.delete),
            title: Text("Delete"),
          ),
          value: 2,
        ),
      ],
    );
  }
}
