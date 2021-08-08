import 'package:flutter/material.dart';
import '../widgets/tasks_list.dart';
import 'add_task_screen.dart';
import '../models/task.dart';

class TaskScreen extends StatefulWidget {
  createState() => TaskScreenState();
}

class TaskScreenState extends State {
  List<Task> tasks = [
    Task(name: 'Task A'),
    Task(name: 'Task B'),
    Task(name: 'Task C'),
  ];

  Widget build(context) {
    return Scaffold(
      backgroundColor: Color(0xFF07273d),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF07273d),
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => AddTaskScreen((String finalTaskTitle) {
              setState(() {
                tasks.add(Task(name: finalTaskTitle));
              });
              Navigator.pop(context);
            }),
          );
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
                top: 60.0, right: 20.0, bottom: 0.0, left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  child: Icon(
                    Icons.list,
                    size: 30.0,
                    color: Color(0xFF07273d),
                  ),
                  backgroundColor: Colors.white,
                  radius: 30.0,
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  'TodoState',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  '${tasks.length} Tasks',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Color(0xffdee6f3),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: TasksList(
                tasks: tasks,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
