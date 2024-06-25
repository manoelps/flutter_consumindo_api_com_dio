import 'package:flutter_consumindo_api_com_dio/src/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //! iniciando o controller
  final controller = HomeController();

  //! criando um metodo para cada status
  _success() => ListView.builder(
      itemCount: controller.todos.length,
      itemBuilder: (context, index) {
        //! acessa o todo
        var todo = controller.todos[index];
        return ListTile(
          leading: Checkbox(
            value: todo.completed,
            onChanged: (value) {},
          ),
          title: Text(todo.title.toString()),
        );
      });

  _error() => Center(
        child: ElevatedButton(
          onPressed: () {
            controller.start(); //! tentando novamente
          },
          child: const Text('Tentar novamente'),
        ),
      );

  _loading() => const Center(
          child: CircularProgressIndicator(
        color: Colors.red,
      ));

  _start() {
    return Container();
  }

  //! metodo para gerenciar os estados da aplicacao
  stateManagement(HomeState state) {
    switch (state) {
      case HomeState.start:
        return _start();
      case HomeState.loading:
        return _loading();
      case HomeState.error:
        return _error();
      case HomeState.success:
        return _success();
      default:
        return _start();
    }
  }

  @override
  void initState() {
    super.initState();
    //! ja chama o .start para iniciar todo o processo
    controller.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text(
            "List Todo's",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  controller.start();
                },
                icon: const Icon(
                  Icons.refresh_outlined,
                  color: Colors.white,
                ))
          ],
        ),
        body: AnimatedBuilder(
          animation: controller.state,
          builder: (context, child) {
            return stateManagement(controller.state.value);
          },
        ));
  }
}
