import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/controller.dart';
import 'package:flutter_application_1/database/db.dart';
import 'package:flutter_application_1/view/screens/home.dart';
import 'package:get/get.dart';

void main() {
  runApp( MyApp());
 // DBHelper.initDB();
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

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'test_gpt/logic.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   final TodoController todoController = Get.put(TodoController());

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'To-Do App',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('To-Do App'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Expanded(
//                 child: Obx(() => ListView.builder(
//                       itemCount: todoController.todos.length,
//                       itemBuilder: (context, index) {
//                         final todo = todoController.todos[index];
//                         return ListTile(
//                           title: Text(todo.text),
//                           trailing: Checkbox(
//                             value: todo.completed,
//                             onChanged: (value) {
//                               // todoController.updateDB(todo.copyWith(
//                               //   completed: value,
//                               // ));
//                             //  todoController.updateDB();
                            
//                             },
//                           ),
//                           onLongPress: () {
//                             todoController.delete(todo);
//                           },
//                         );
//                       },
//                     )),
//               ),
//               TextField(
//                 onSubmitted: (text) {
//                   todoController.create(text);
//                 },
//                 decoration: InputDecoration(
//                   hintText: 'Add a to-do item',
//                   contentPadding: EdgeInsets.all(20),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

