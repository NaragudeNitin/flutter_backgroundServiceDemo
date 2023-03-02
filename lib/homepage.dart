import 'package:flutter/material.dart';
import 'package:workmanager/workmanager.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, });
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();
    Workmanager().registerPeriodicTask(
      "taskTwo",
      "backUp",
      frequency: const Duration(minutes: 15),
    );
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Work manager Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () async{
                  // await Workmanager().registerOneOffTask(
                  //   "taskOne",
                  //   "backUp",
                  //   initialDelay: const Duration(seconds: 5),
                  // );
                  var uniqueName = DateTime.now().second.toString();
                  await Workmanager().registerPeriodicTask(
                    uniqueName, 
                    'First Task',
                    initialDelay: const Duration(seconds: 10),
                    constraints: Constraints(networkType: NetworkType.not_required)
                  );
                },
                child: const Text("Run Task")),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Workmanager().cancelByUniqueName("taskOne");
                },
                child: const Text("Cancel Task"))
          ],
        ),
      ),
    );
  }
}
