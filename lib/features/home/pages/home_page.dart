import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/core/app_themes.dart';
import 'package:todoapp/features/home/models/tarefa_model.dart';
import 'package:todoapp/core/widgets/custom_text_field.dart';
import 'package:todoapp/features/home/pages/details_todo_page.dart';
import 'package:todoapp/features/home/pages/widgets/drawer_widget.dart';
import 'package:todoapp/features/home/pages/state/theme_provider.dart';
import 'package:todoapp/features/home/services/tarefa_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController pesquisaController = TextEditingController();
  final TextEditingController tituloController = TextEditingController();
  final TextEditingController descricaoController = TextEditingController();
  List<TarefaModel> tarefas = [];
  List<TarefaModel> tarefasFiltradas = [];
  final tarefaService = TarefaService();
  final _form = GlobalKey<FormState>();

  @override
  void initState() {
    //Ficar ouvindo o campo de titulo sendo digitado, e ja vou filtrando.
    //Aqui eu passo por parâmetro na função na função filtrar, o texto que está no campo titulo;
    tituloController.addListener(() => _filtrarTarefa(tituloController.text));
    loadTarefas();
    super.initState();
  }

  Future<void> loadTarefas() async {
    final response = await tarefaService.getTarefas();
    setState(() {
      tarefas = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppThemes.orange,
        title: const Text('Lista de Tarefas'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              themeProvider.themeMode == ThemeMode.dark
                  ? Icons.wb_sunny
                  : Icons.nights_stay,
            ),
            onPressed: () {
              themeProvider.toggleTheme();
            },
          ),
        ],
      ),
      drawer: const DrawerWidget(),
      body: Form(
        key: _form,
        child: Column(
          children: [
            const SizedBox(height: 16),
            CustomTextField(
              hintText: 'Informe o que deseja pesquisar',
              label: 'Pesquisa',
              controller: pesquisaController,
              validator: (value) {
                return null;
              },
              suffixButton: IconButton(
                onPressed: () => _filtrarTarefa(pesquisaController
                    .text), //Aqui eu passo por parâmetro na função na função filtrar, o texto que está no campo pesquisa;
                icon: const Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 16),
            CustomTextField(
              hintText: 'Digite o título',
              label: 'Título',
              controller: tituloController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'O campo de título não pode ser vazio';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            CustomTextField(
              hintText: 'Digite a descrição',
              label: 'Descrição',
              controller: descricaoController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'O campo de descrição não pode ser vazio';
                } else if (value.length < 3) {
                  return 'A descrição precisar ter pelo menos 3 caracteres';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            const Text(
              'Lista de Tarefas',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: tarefas.length,
                itemBuilder: (context, index) {
                  final tarefa = tarefas[index];

                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              DetailsTodoPage(heroTag: 'imageHero_$index'),
                        ),
                      );
                    },
                    child: ListTile(
                      leading: Hero(
                        tag: 'imageHero_$index',
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            'https://inovareducacaodeexcelencia.com/image/catalog/Tarefa%20pra%20casa_01.jpg',
                            height: 60,
                            width: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Text(tarefa.titulo),
                      subtitle: Text(tarefa.descricao ?? ''),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () => _editarTarefa(tarefa.id),
                            icon: const Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () => _removeTarefa(tarefa.id),
                            icon: const Icon(Icons.delete),
                          ),
                          Checkbox(
                            checkColor: Colors.white,
                            activeColor: AppThemes.orange,
                            value: tarefa.isCompleted,
                            onChanged: (bool? value) {
                              setState(() {
                                tarefa.isCompleted = value ?? false;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppThemes.orange,
        foregroundColor: Colors.white,
        //footer
        onPressed: _addTarefa,
        child: const Icon(Icons.add),
      ),
    );
  }

  // " _ " = Métodos privados, que só podem ser acessados no próprio contexto;
  void _addTarefa() {
    if (_form.currentState!.validate()) {
      setState(() {
        tarefas.add(
          // TarefaModel(
          //   id: tarefa.id,
          //   titulo: tarefa.titulo,
          //   isCompleted: tarefa.isCompleted,
          // ),
          TarefaModel(
            id: 1,
            titulo: tituloController.text,
            descricao: descricaoController.text,
            isCompleted: false,
          ),
        );
      });

      tituloController.clear();
      descricaoController.clear();
    }
  }

  Future<void> _removeTarefa(int index) async {
    final response = await tarefaService.deleteTarefa(index);
    setState(() {
      tarefas.removeAt(index);
      if (response) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Tarefa excluída com sucesso: $index',
            ),
          ),
        );
      }
    });
    // setState(() {
    //   tarefas.removeAt(index);
    // });
  }

  Future<void> _editarTarefa(int index) async {
    final tarefa = tarefas[index];

    tituloController.text = tarefa.titulo;
    descricaoController.text = tarefa.descricao ?? '';

    final response = await tarefaService.editTarefa(index);

    setState(() {
      //ToDo: Realizar O SAVE Novamente da tarefa que tem o ID que você recebeu no index.
      if (response) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Tarefa editada com sucesso: $index',
            ),
          ),
        );
      }
    });
    // setState(() {
    //   tarefas.removeAt(index);
    // });
  }

  void _filtrarTarefa(String tituloDaTarefa) {
    setState(() {
      // Tarefas filtradas buscando na lista de tarefas que eu tenho, o mesmo titulo da lista de tarefas o campo titulo;
      tarefasFiltradas = tarefas
          .where(
              (tarefa) => tarefa.titulo.toLowerCase().contains(tituloDaTarefa))
          .toList();
    });
  }
}
