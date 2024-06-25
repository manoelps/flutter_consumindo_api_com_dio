import 'package:flutter_consumindo_api_com_dio/src/controllers/home_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final controller = HomeController();

  test('deve preencher a variavel todos', () async {
    expect(controller.state, HomeState.start);
    await controller.start();
    expect(controller.state, HomeState.success);
    expect(controller.todos.isNotEmpty, true);
  });
}
