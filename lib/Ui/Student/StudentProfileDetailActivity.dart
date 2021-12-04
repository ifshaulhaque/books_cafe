import 'package:books_cafe/UiDesign/Designs.dart';
import 'package:flutter/material.dart';

class StudentProfileDetailActivity extends StatelessWidget {
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
              ElevatedButtonBack("Update"),
            ],
          ),
        ),
      ),
    );
  }
}
