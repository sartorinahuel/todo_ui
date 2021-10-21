import 'package:flutter/material.dart';
import 'package:todo_ui/domain/models/task.dart';

class Project {
  final String id;
  String name = '';
  IconData icon = Icons.work_rounded;
  Color color = Colors.blue;
  List<Task> tasks = [];

  Project(this.id);

  void addTask(Task newTask) => tasks.add(newTask);
  void changeIcon(IconData newIcon) => icon = newIcon;
  void changeName(String newName) => name = newName;
  void changeColor(Color newColor) => color = newColor;
}
