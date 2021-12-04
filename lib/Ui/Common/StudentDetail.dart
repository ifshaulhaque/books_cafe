import 'package:books_cafe/UiDesign/Designs.dart';
import 'package:flutter/material.dart';

import '../../Constants.dart';

// const ADDABLE_BUTTON = 100;
// const EDITABLE_BUTTON = 101;
// const NO_BUTTON = 102;

var buttonType;

class StudentDetail extends StatefulWidget {
  var type;

  StudentDetail(this.type) {
    buttonType = type;
  }

  @override
  State<StudentDetail> createState() => _BooksDetailState();
}

class _BooksDetailState extends State<StudentDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolleds) {
          return <Widget>[
            SliverAppBar(
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back),
              ),
              actions: [
                GestureDetector(onTap: () {
                  setState(() {
                    buttonType = EDITABLE_BUTTON;
                  });
                },
                    child: EditIcon()),
              ],
              pinned: true,
              expandedHeight: 200,
              floating: false,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text("Student Name"),
                background: Image.asset(
                  "assets/library.jpg",
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ];
        },
        body: Center(
          child: Column(
            children: [
              TextFieldWithOutlinedBorder(
                "Name",
                Icon(Icons.person),
              ),
              TextFieldWithOutlinedBorder(
                "Roll No",
                Icon(Icons.app_registration_rounded),
              ),
              TextFieldWithOutlinedBorder(
                "Mobile Number",
                Icon(Icons.local_phone),
              ),
              TextFieldWithOutlinedBorder(
                "Address",
                Icon(Icons.location_history),
              ),
              AddButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class AddButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (buttonType == ADDABLE_BUTTON) {
      return  ElevatedButtonBack("Add Book");
    } else if (buttonType == EDITABLE_BUTTON) {
      return  ElevatedButtonBack("Update");
    } else if (buttonType == READ_ONLY) {
      return Container();
    } else {
      return Container();
    }
  }
}

class EditIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (buttonType == NO_BUTTON) {
      return Icon(Icons.edit);
    } else {
      return Container();
    }
  }
}