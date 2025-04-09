import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todoapp/features/home/models/tarefa_model.dart';

class TarefaService {
  final String _baseUrl = 'https://jsonplaceholder.typicode.com/todos';

  Future<List<TarefaModel>> getTarefas() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);

      return jsonList.map((json) => TarefaModel.fromJson(json)).toList();
    } else {
      throw Exception('Deu erro ao tentar buscar do servidor as tarefas');
    }
  }
}
