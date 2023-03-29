import 'package:flutter/material.dart';
import 'package:flutter_application_1/database/db.dart';
import 'package:get/get.dart';

import '../view/screens/archieved.dart';
import '../view/screens/done.dart';
import '../view/screens/tasks.dart';

class MyController extends GetxController {
  int currentIndex = 0;
  TextEditingController titleController = TextEditingController();
 TextEditingController dateController = TextEditingController(); 
  TextEditingController timeController = TextEditingController(); 

  bool isBottomSheetOpened = false;
  
  IconData fabIcon = Icons.edit;

  void changeFabIcon()
  {
    isBottomSheetOpened ? fabIcon = Icons.add : fabIcon = Icons.edit;
    // fabIcon  = Icons.edit ;
    update();
  }

  List<Widget> screens =  [
    Tasks(),
   const  Done(),
   const Archived(),
  ];
  List<String> titles = [
    'Tasks',
    'Done',
    'Archived',
  ];

  void changeNavigationBar(int index) {
    currentIndex = index;
    update();
    debugPrint('$currentIndex');
  }

  List<Map> tasks = []; 
  void updateDB() async
  {
            DBHelper.getDB().then((value) => tasks = value );
           print('this is the new list : $tasks'); 
           update(); 
  }
}
