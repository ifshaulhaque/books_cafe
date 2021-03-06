import 'package:books_cafe/Constants.dart';
import 'package:books_cafe/Model/Models.dart';
import 'package:books_cafe/Ui/Common/StudentDetail.dart';
import 'package:books_cafe/UiDesign/Designs.dart';
import 'package:flutter/material.dart';

import 'InstituteSearchStudent.dart';

class InstituteStudentsActivity extends StatelessWidget {
  const InstituteStudentsActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => InstituteSearchStudent()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.purple,
      ),
      body: getListWidget(),
    );
  }
}

Widget getListWidget() {
  var list = getStudentsList();
  StudentsCardModel data;

  return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, position) {
        data = list[position];
        return ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => StudentDetail(READ_ONLY)),
            );
          },
          title: Row(
            children: [
              Expanded(
                child: Text(data.name),
              ),
              Text(data.totalBooksissued.toString()),
            ],
          ),
          subtitle: Row(
            children: [
              Expanded(
                child: Text(data.registrationNumber.toString()),
              ),
            ],
          ),
          leading: RoundImage(),
          trailing: PopupMenu(),
        );
      });
}

List getStudentsList() {
  var model = new StudentsCardModel();
  model.name = "Student Name";
  model.totalBooksissued = 10;
  model.registrationNumber = 19105126908;
  List<StudentsCardModel> list = [];
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
        PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.call),
            title: Text("Call"),
          ),
          value: 2,
        ),
        PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.notifications),
            title: Text("Issue Notification"),
          ),
          value: 3,
        ),
      ],
    );
  }
}
