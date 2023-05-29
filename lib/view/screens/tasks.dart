import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/controller.dart';
import 'package:get/get.dart';

import '../widgets/task_item.dart';

class Tasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return GetBuilder<MyController>(
      builder: (_) => ListView.separated(
        itemBuilder: (BuildContext context, int index) => TaskItem(
          task: _.tasks[index],
        ),
        separatorBuilder: (BuildContext context, int index) => Container(
          height: 1.5,
        ),
        itemCount: _.tasks.length,
      ),
    );
  }
}
