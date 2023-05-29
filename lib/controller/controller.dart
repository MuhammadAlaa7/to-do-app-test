import 'package:flutter/material.dart';
import 'package:flutter_application_1/database/db.dart';
import 'package:get/get.dart';

import '../view/screens/archieved.dart';
import '../view/screens/done.dart';
import '../view/screens/tasks.dart';

class MyController extends GetxController {
  final BaseDataBaseHelper db = DataBaseHelper();

  int currentIndex = 0;
  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  bool isBottomSheetOpened = false;

  IconData fabIcon = Icons.edit;

  void changeFabIcon() {
    isBottomSheetOpened ? fabIcon = Icons.add : fabIcon = Icons.edit;
    // fabIcon  = Icons.edit ;
    update();
  }

//List<Map<String, Object?>> tasks2 = [];
  var tasks = [];

  List<Widget> screens = [
    Tasks(),
    const Done(),
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

    Future<void> putDataIntoDataBase() async {
    await db.insertDataBase(
      title: titleController.text,
      date: dateController.text,
      time: timeController.text,
    );

    print('Task has been inserted into the Database');
    getData();
  }

  void getData() async {
    final result = await db.getDataFromDataBase();
    tasks = result;
    update();
  }



@override
  void onInit() {

        db.initDataBase().then((_) =>  getData() );
    super.onInit();
  
  }




















//

  // void getDataFromDB() async {
  //   DBHelper.getDB().then((value) {
  //     tasks = value;

  //     print('new new new $tasks');
  //     update();
  //     print('Data updated...');
  //   });
  //   update();
  // }
}
