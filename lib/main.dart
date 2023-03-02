import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:workmanager/workmanager.dart';

import 'homepage.dart';

const taskName = 'firsttask';

sendData(){
  log("Send Data Function hiiiiiiiiiii");
}
void callbackDispatcher(){
  Workmanager().executeTask((taskName, inputData) {
    //specified call back handler used to perform background task
    switch (taskName) {
      case 'firsttask':
        sendData();
        log("first task executed");
        break;
      default:
    }
   log("Task excecuting : $taskName");
   return Future.value(true);
   
  });
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  const MyHomePage(),
    );
  }
}

