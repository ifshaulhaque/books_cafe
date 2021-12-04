import 'package:books_cafe/UiDesign/Designs.dart';
import 'package:flutter/material.dart';

import '../../Constants.dart';

// const ADDABLE_BUTTON = 100;
// const EDITABLE_BUTTON = 101;
// const NO_BUTTON = 102;

var buttonType;

class BooksDetail extends StatefulWidget {
  var type;

  BooksDetail(this.type) {
    buttonType = type;
  }

  @override
  State<BooksDetail> createState() => _BooksDetailState();
}

class _BooksDetailState extends State<BooksDetail> {
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
                title: Text("Books Name"),
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
                Icon(Icons.book),
              ),
              TextFieldWithOutlinedBorder(
                "Publisher",
                Icon(Icons.account_balance),
              ),
              TextFieldWithOutlinedBorder(
                "Author",
                Icon(Icons.person),
              ),
              TextFieldWithOutlinedBorder(
                "Available Quantity",
                Icon(Icons.app_registration),
              ),
              TextFieldWithOutlinedBorder(
                "Total Quantity",
                Icon(Icons.app_registration),
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