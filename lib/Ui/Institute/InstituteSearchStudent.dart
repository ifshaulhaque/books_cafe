import 'package:books_cafe/Constants.dart';
import 'package:books_cafe/Model/Models.dart';
import 'package:books_cafe/Ui/Common/StudentDetail.dart';
import 'package:books_cafe/UiDesign/Designs.dart';
import 'package:flutter/material.dart';

class InstituteSearchStudent extends StatelessWidget {
  const InstituteSearchStudent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              MaterialPageRoute(builder: (context) => StudentDetail(READ_ONLY)),
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
          trailing: ElevatedButton(
            onPressed: () {},
            child: Text("Add"),
          ),
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
