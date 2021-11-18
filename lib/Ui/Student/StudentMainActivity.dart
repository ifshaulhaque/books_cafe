import 'package:books_cafe/Ui/Student/StudentAccountActivity.dart';
import 'package:books_cafe/Ui/Student/StudentLibraryActivity.dart';
import 'package:books_cafe/Ui/Student/StudentMyBooksActivity.dart';
import 'package:books_cafe/Ui/Student/StudentNotificationActivity.dart';
import 'package:flutter/material.dart';

class StudentMainActivity extends StatefulWidget {
  @override
  State<StudentMainActivity> createState() => _StudentMainActivityState();
}

class _StudentMainActivityState extends State<StudentMainActivity> {

  int _currentIndex = 0;

  final tabs = [
    Center(
      child: StudentLibraryActivity(),
    ),
    Center(
      child: StudentMyBooksActivity(),
    ),
    Center(
      child: StudentMyNotificationActivity(),
    ),
    Center(
      child: StudentAccountActivity(),
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
            icon: Icon(Icons.library_books),
            title: Text("Library"),
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            title: Text("My Books"),
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            title: Text("Notification"),
            backgroundColor: Colors.blue,
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