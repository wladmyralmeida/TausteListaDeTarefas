import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/core/app_themes.dart';
import 'package:todoapp/features/home/models/tarefa_model.dart';
import 'package:todoapp/core/widgets/custom_text_field.dart';
import 'package:todoapp/features/home/pages/widgets/drawer_widget.dart';
import 'package:todoapp/features/home/pages/state/theme_provider.dart';

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
  final _form = GlobalKey<FormState>();

  @override
  void initState() {
    //Ficar ouvindo o campo de titulo sendo digitado, e ja vou filtrando.
    //Aqui eu passo por parâmetro na função na função filtrar, o texto que está no campo titulo;
    tituloController.addListener(() => _filtrarTarefa(tituloController.text));

    super.initState();
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
            Expanded(
              child: ListView.builder(
                itemCount: tarefasFiltradas.length,
                itemBuilder: (context, index) {
                  final tarefa = tarefasFiltradas[index];

                  return ListTile(
                    title: Text(tarefa.titulo),
                    subtitle: Text(tarefa.descricao),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () => _editarTarefa(index),
                          icon: const Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () => _removeTarefa(index),
                          icon: const Icon(Icons.delete),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
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
          TarefaModel(
            titulo: tituloController.text,
            descricao: descricaoController.text,
          ),
        );
      });

      tituloController.clear();
      descricaoController.clear();
    }
  }

  void _removeTarefa(int index) {
    setState(() {
      tarefas.removeAt(index);
    });
  }

  void _editarTarefa(int index) {
    final tarefa = tarefas[index];

    tituloController.text = tarefa.titulo;
    descricaoController.text = tarefa.descricao;

    setState(() {
      _removeTarefa(index);
    });
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

  _switchTheme() {}
}
