// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/controller.dart';
import 'package:flutter_application_1/database/db.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../widgets/input_form.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final GlobalKey<FormState> formKey = GlobalKey();
  final MyController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyController>(

        ///||||||||||||||||||| YOU FORGOT TO REBUILD THE UPDATE OF THE STATE |||||||||||
        builder: (_) {
      return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text(
            controller.titles[controller.currentIndex],
          ),
        ),
        body: controller.screens[controller.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Task'),
            BottomNavigationBarItem(icon: Icon(Icons.done), label: 'Done'),
            BottomNavigationBarItem(icon: Icon(Icons.archive), label: 'Archive')
          ],
          currentIndex: controller.currentIndex,
          onTap: (int index) => controller.changeNavigationBar(index),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            controller.fabIcon,
            // controller.isBottomSheetOpened ?   Icons.add :controller.fabIcon,
          ),
          onPressed: () {
            //showModalBottomSheet(context: context, builder: (_) => Container());
           
            if(controller.isBottomSheetOpened)
            {
              Navigator.pop(context);
              //After closing it insert and get the tasks.
               DBHelper.insertDB(
              title: controller.titleController.text , 
              date: controller.dateController.text, 
              time: controller.timeController.text, 
            ).then((_) => controller.updateDB() );
          // DBHelper.deleteDB();
            
            controller.isBottomSheetOpened = !controller.isBottomSheetOpened;
            controller.changeFabIcon();
           
            }
            else
            {
                 viewBottomSheet(context);
                 
            controller.isBottomSheetOpened = !controller.isBottomSheetOpened;
            controller.changeFabIcon();
           
            }


          },
        ),
      );
    });
  }

  void showDate(BuildContext context) {
    showDatePicker(
            context: context,
            firstDate: DateTime(2020),
            lastDate: DateTime(2025),
            initialDate: DateTime.now())
        .then((value) =>
            controller.dateController.text = DateFormat.yMMMd().format(value!));
  }

  void showTime(BuildContext context) {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then(
      (value) => controller.timeController.text = value!.format(context),
    );
  }


  void viewBottomSheet(BuildContext context)
  {

     scaffoldKey.currentState!.showBottomSheet(
                    (context) => Form(
                      key: formKey,
                      child: Container(
                        height: 300,
                        color: const Color.fromARGB(255, 15, 196, 196),
                        child: Column(
                          children: [
                            InputField(
                              controller: controller.titleController,
                              isReadOnly: false,
                              hint: 'Enter Task Title',
                              icon: const Icon(
                                Icons.title_rounded,
                              ),
                              label: const Text('Title'),
                            ),
                            InputField(
                              controller: controller.dateController,
                              onTap: () => showDate(context),
                              isReadOnly: true,
                              hint: 'Enter Task Date',
                              icon: const Icon(
                                Icons.calendar_month_outlined,
                              ),
                              label: const Text('Date'),
                            ),
                            InputField(
                              controller: controller.timeController,
                              onTap: () => showTime(context),
                              isReadOnly: true,
                              hint: 'Enter Task Time',
                              icon: const Icon(
                                Icons.timer_sharp,
                              ),
                              label: const Text('Time'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
  }
}
