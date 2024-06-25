//! classe responsável pela comunicacao com a api

import 'package:flutter_consumindo_api_com_dio/src/models/todo_model.dart';
import 'package:dio/dio.dart';

class TodoRepository {
  //! Instancia o Dio para comunicacao com api
  final Dio dio = Dio();
  final url = 'https://jsonplaceholder.typicode.com/todos/';

  Future<List<TodoModel>> fetchTodos() async {
    final response = await dio.get(url);
    //! como o retorno é um array, precisa transformar em lista
    final list = response.data as List;

    //! usando map para retonar uma lista dos dados
    return list.map((json) => TodoModel.fromJson(json)).toList();

    //? FORMA DE SE FAZER COM FOR
    // //! cria uma lista de TodoModel chamada todos
    // List<TodoModel> todos = [];
    // //! faz um for para percorrer a lista e obter os dados
    // for (var json in list) {
    //   final todo = TodoModel.fromJson(json); //! serializa cada json
    //   todos.add(todo); //! adiciona na lista todos
    // }
    // return todos;
  }
}
