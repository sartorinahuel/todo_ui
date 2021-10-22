import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_ui/domain/models/projects.dart';
import 'package:todo_ui/domain/models/task.dart';

class ProjectRepository {
  final List<Project> _projects = [];

  final StreamController<List<Project>> _projectsStreamController = StreamController<List<Project>>.broadcast();
  Stream<List<Project>> get projectsStream => _projectsStreamController.stream;

  //
  final Project _project1 = Project('1111');
  final Project _project2 = Project('1112');
  final Project _project3 = Project('1113');
  final Project _project4 = Project('1114');

  //Tasks
  final Task _task1 = Task('id1');
  final Task _task2 = Task('id2');
  final Task _task3 = Task('id3');
  final Task _task4 = Task('id4');
  final Task _task5 = Task('id5');
  final Task _task6 = Task('id6');
  final Task _task7 = Task('id7');
  final Task _task8 = Task('id8');
  final Task _task9 = Task('id9');

  //
  ProjectRepository() {
    _project1.changeName('Personal');
    _project2.changeName('Work');
    _project3.changeName('Home');
    _project4.changeName('Pets');

    //colors
    _project1.changeColor(Colors.blue);
    _project2.changeColor(Colors.grey);
    _project3.changeColor(Colors.green);
    _project4.changeColor(Colors.red);

    //icons
    _project1.changeIcon(Icons.person_rounded);
    _project1.changeIcon(Icons.work_rounded);
    _project1.changeIcon(Icons.home_rounded);
    _project1.changeIcon(Icons.pets_rounded);

    //tasks
    _task1.title = 'fasdfad';
    _task2.title = 'dfdfaadfdf';
    _task3.title = 'dfdfaadfdf';
    _task4.title = 'dfdfaadfdf';
    _task5.title = 'dfdfaadfdf';
    _task6.title = 'dfdfaadfdf';
    _task7.title = 'dfdfaadfdf';
    _task8.title = 'dfdfaadfdf';
    _task9.title = 'dfdfaadfdf';

    _project1.addTask(_task1);
    _project1.addTask(_task2);
    _project2.addTask(_task3);
    _project2.addTask(_task4);
    _project2.addTask(_task5);
    _project2.addTask(_task6);
    _project3.addTask(_task7);
    _project3.addTask(_task8);
    _project4.addTask(_task9);

    _projects.add(_project1);
    _projects.add(_project2);
    _projects.add(_project3);
    _projects.add(_project4);
  }

  void initialize() {
    _projectsStreamController.sink.add(_projects);
  }

  void addProject(Project newProject) {
    _projects.add(newProject);
    _projectsStreamController.sink.add(_projects);
  }
}

final projectsRepo = ProjectRepository();
