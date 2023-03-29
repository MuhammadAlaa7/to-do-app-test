
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/controller.dart';
import 'package:flutter_application_1/database/db.dart';
import 'package:flutter_application_1/view/screens/home.dart';
import 'package:get/get.dart';

void main() {
  runApp( MyApp());
  DBHelper.initDB();
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//keep
    Get.put(MyController()); 
  
          return MaterialApp(
            
            home: HomePage(),
            debugShowCheckedModeBanner: false,
          );
  }
 
  
  }
