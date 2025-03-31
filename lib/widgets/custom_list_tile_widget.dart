import 'package:flutter/material.dart';
import 'package:todoapp/todo.dart';

class CustomListTileWidget extends StatefulWidget {
  final List<Todo> todosList;

  const CustomListTileWidget({
    super.key,
    required this.todosList,
  });

  @override
  State<CustomListTileWidget> createState() => _CustomListTileWidgetState();
}

class _CustomListTileWidgetState extends State<CustomListTileWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.todosList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(
                widget.todosList[index].title,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                widget.todosList[index].subtitle,
                style: const TextStyle(fontSize: 16, letterSpacing: 1.5),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              trailing: !widget.todosList[index].isDone
                  ? IconButton(
                      icon: Icon(
                        Icons.check_box,
                        color: Colors.white.withOpacity(0.5),
                      ),
                      onPressed: () async {
                        await showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                'Deseja CONCLUIR a tarefa? \n\n${widget.todosList[index].title}',
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              actions: <Widget>[
                                ElevatedButton(
                                  style: const ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll<Color>(Colors.red),
                                  ),
                                  child: const Text('Cancelar'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                ElevatedButton(
                                  style: const ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll<Color>(Colors.green),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      widget.todosList[index].isDone = true;
                                    });
                                    Navigator.of(context).pop();

                                    final snackBar = SnackBar(
                                      content: const Text('Parabéns! Você concluiu mais uma tarefa!!🥳'),
                                      action: SnackBarAction(
                                        label: 'Ok',
                                        onPressed: () {},
                                      ),
                                    );

                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);

                                    FocusManager.instance.primaryFocus?.unfocus();
                                  },
                                  child: const Text('Sim'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    )
                  : IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () async {
                        await showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Deseja DELETAR a tarefa? \n\n${widget.todosList[index].title}'),
                              actions: <Widget>[
                                ElevatedButton(
                                  style: const ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll<Color>(Colors.red),
                                  ),
                                  child: const Text('Cancelar'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                ElevatedButton(
                                  style: const ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll<Color>(Colors.green),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      widget.todosList.removeAt(index);
                                    });
                                    Navigator.of(context).pop();

                                    final snackBar = SnackBar(
                                      content: const Text('Você excluiu a tarefa com sucesso! ❌'),
                                      action: SnackBarAction(
                                        label: 'Ok',
                                        onPressed: () {},
                                      ),
                                    );

                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);

                                    FocusManager.instance.primaryFocus?.unfocus();
                                  },
                                  child: const Text('Sim'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
            ),
          );
        },
      ),
    );
  }
}
