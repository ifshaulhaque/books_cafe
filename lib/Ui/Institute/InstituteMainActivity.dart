import 'package:books_cafe/Ui/Institute/InstituteAccountActivity.dart';
import 'package:books_cafe/Ui/Institute/InstituteBooksActivity.dart';
import 'package:books_cafe/Ui/Institute/InstituteExpireActivity.dart';
import 'package:books_cafe/Ui/Institute/InstituteIssueActivity.dart';
import 'package:books_cafe/Ui/Institute/InstituteStudentsActivity.dart';
import 'package:flutter/material.dart';

class InstituteMainActivity extends StatefulWidget {
  const InstituteMainActivity({Key? key}) : super(key: key);

  @override
  State<InstituteMainActivity> createState() => _InstituteMainActivityState();
}

class _InstituteMainActivityState extends State<InstituteMainActivity> {

  int _currentIndex = 0;

  final tabs = [
    Center(
      child: InstituteBooksActivity(),
    ),
    Center(
      child: InstituteStudentsActivity(),
    ),
    Center(
      child: InstituteIssueActivity(),
    ),
    Center(
      child: InstituteExpireActivity(),
    ),
    Center(
      child: InstituteAccountActivity(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            title: Text("Books"),
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            title: Text("Students"),
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.upload_file),
            title: Text("Issue"),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_circle_down),
            title: Text("Expiry"),
            backgroundColor: Colors.cyan,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("Account"),
            backgroundColor: Colors.green,
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}