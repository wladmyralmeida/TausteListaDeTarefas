import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final snackBar = SnackBar(
      content: Text('Sua tarefa mudou de "em progresso" para "concluida"'));

  @override
  void initState() {
    //inicio uma chamada para uma api, pra buscar todos as terefas que tem la.
  }

  void didChangeDependences() {
    //quando uma tarefa mudar de 'em progresso' para 'concluida'
    //-> execute uma funcao de mostrar uma snackbar de sucesso.
  }

  @override
  Widget build(BuildContext context) {
    Widget textField = const TextField(
      maxLines: 1,
      decoration: InputDecoration(
        hintText: 'O que você deseja comprar?',
        border: OutlineInputBorder(
          borderSide: BorderSide(),
        ),
      ),
    );

    double numeroDaTarefaArrowFunction() => 10;

    double numeroDaTarefaComChaves() {
      return 10;
    }

//GestureDetector
    Widget textoDaTarefa() => GestureDetector(
          onTap: () => print('Acabei de clicar uma vez na tarefa'),
          onDoubleTap: () => print('Acabei de duas vezes na tarefa'),
          onLongPress: () => print('cliquei e segurei'),
          child: Text(
            'Tarefa ${numeroDaTarefaArrowFunction()}',
            style: const TextStyle(fontSize: 30.0),
          ),
        );

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          textField,
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            // child: ListView(
            //   children: [
            //     textoDaTarefa(),
            //     textoDaTarefa(),
            //   ],
            // ),
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (contexto, categoria) {
                //separar em categorias
                //colocar produtos em categorias separadas
                return textoDaTarefa();
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(91, 54, 105, 244),
        child: const Icon(Icons.add),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          // Esse botão irá implementar a função de adicionar itens ao carrinho.
        },
      ),
    );
  }
}
