

import 'dart:convert';

import 'package:get/get.dart';
import 'package:getxmanagement/model/todo_model.dart';
import 'package:http/http.dart' as http;

class ToDoController extends GetxController{
  var todoList = RxList<ToDoModel>();

  @override
  void onInit(){
    super.onInit();
    getData();
  }


  // get data
  Future<RxList<ToDoModel>> getData() async{
    print("cdutf8");
    final response = await http.get(Uri.parse("https://6706810ba0e04071d22727ce.mockapi.io/Todo"));
    final data = jsonDecode(response.body.toString());
    print(response.statusCode);

    if(response.statusCode == 200 || response.statusCode == 201)
      {
        for(Map<String , dynamic> item in data)
          {
            todoList.add(ToDoModel.fromJson(item));
          }
        return todoList;
      }else{
      return todoList;
    }
  }

  // post data
  Future postData(String description) async {
    print("vwceycv");
    final response = await http.post(Uri.parse("https://6706810ba0e04071d22727ce.mockapi.io/Todo"),headers: {
      "Content-Type" : "application/json"
    },
    body: jsonEncode(ToDoModel(description: description))
    );

    print(response.body);
    if(response.statusCode == 200 || response.statusCode == 201)
      {
        todoList.clear();
        getData();
      }else{
      print("error");
    }
  }
  
  // delete data
  Future deleteData(id) async{
    final response = await http.delete(Uri.parse("https://6706810ba0e04071d22727ce.mockapi.io/Todo/${id}"));

    if(response.statusCode == 201 || response.statusCode == 200)
      {
        todoList.clear();
        getData();
      }else{
      print("failed");
    }

  }
  
  





}