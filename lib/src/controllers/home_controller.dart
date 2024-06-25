//! controlar o status da homePage

import 'package:flutter_consumindo_api_com_dio/src/models/todo_model.dart';
import 'package:flutter_consumindo_api_com_dio/src/repositories/todo_repository.dart';
import 'package:flutter/material.dart';

class HomeController {
  List<TodoModel> todos = [];
  final repository = TodoRepository();

  //! TORNANDO REATIVO .. USANDO ValueNotifier PARA MONITIORAR A MUDANCA DA VARIAVEL
  final state = ValueNotifier<HomeState>(HomeState.start);

  //! cria o state e ja inicializa com o enum do tipo start
  // HomeState state = HomeState.start;

  //! criando um metodo para iniciar os dados
  Future start() async {
    state.value = HomeState.loading;

    try {
      todos = await repository.fetchTodos();
      state.value = HomeState.success;
    } catch (e) {
      state.value = HomeState.error;
    }
  }
}

//! enum para controle do status da requisicao
enum HomeState { start, loading, success, error }
