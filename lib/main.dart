import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxmanagement/controller/toto_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  ToDoController controller = Get.put(ToDoController());
  TextEditingController editingController = TextEditingController();

  TextEditingController deleteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();

    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        Get.defaultDialog(
            title: ("Add Task"),
            content: TextField(
              controller: textEditingController,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("Cancel"),
              ),
              TextButton(
                onPressed: () {
                  controller.postData(textEditingController.text);
                  Get.back();
                },
                child: Text("Save"),
              )
            ]);
      },child: Icon(Icons.edit),),
    );
  }
}
