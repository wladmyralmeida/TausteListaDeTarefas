import 'package:flutter/material.dart';
import 'package:todoapp/features/home/models/tarefa_model.dart';
import 'package:todoapp/core/widgets/custom_text_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isChecked = false;
  final TextEditingController tituloController = TextEditingController();
  final TextEditingController descricaoController = TextEditingController();
  List<TarefaModel> tarefas = [];
  List<TarefaModel> tarefasFiltradas = [];
  final _form = GlobalKey<FormState>();

  @override
  void initState() {
    //Ficar ouvindo o campo de titulo sendo digitado, e ja vou filtrando.
    tituloController.addListener(_filtrarTarefa);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF07400),
        title: const Text('Lista de Tarefas'),
        centerTitle: true,
      ), //Cabeçalho
      drawer: Drawer(
        //Menu Saduiche
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://static-00.iconduck.com/assets.00/user-avatar-1-icon-1023x1024-kxqzlgxl.png'),
              ),
              otherAccountsPictures: [
                // Provedores de Imagens : Asset - Local, imagens do projeto;
                // Network - Web, imagens da internet;
                // AssetImage
                // NetworkImage
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/perfil.jpg'),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/perfil.jpg'),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/perfil.jpg'),
                ),
              ],
              decoration: BoxDecoration(color: Color(0xFFF07400)),
              accountName: Text('Fulano De Tal'),
              accountEmail: Text('fulano@tauste.com'),
            ),
            const Text(
              'Departamentos',
              style: TextStyle(
                color: Colors.indigo,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              title: const Text('Tauste Supermercados'),
              subtitle: const Text('Bem-vindo ao Tauste!'),
              trailing: Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.blue,
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value ?? false;
                    });
                  }),
              tileColor: Colors.indigo[900],
              textColor: Colors.white,
              onTap: () => showAboutDialog(
                  applicationName: 'Tauste',
                  applicationVersion: '1.0',
                  context: context),
            ),
            const ListTile(
              title: Text('Concorrencia'),
              subtitle: Text('Bem-vindo a concorrencia!'),
              tileColor: Colors.green,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
      body: Form(
        key: _form,
        child: Column(
          children: [
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
            SizedBox(
              height: 500,
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

  void _filtrarTarefa() {
    final tituloDaTarefa = tituloController.text.toLowerCase();

    setState(() {
      // Tarefas filtradas buscando na lista de tarefas que eu tenho, o mesmo titulo da lista de tarefas o campo titulo;
      tarefasFiltradas = tarefas
          .where(
              (tarefa) => tarefa.titulo.toLowerCase().contains(tituloDaTarefa))
          .toList();
    });
  }

  //ToDo: Criar um novo campo de text field com controller que só vai filtrar
  // as tarefas, após um onTap num IconButton que possui um ícone de pesquisa
  // Widgets que PODEM ser usados -> Icon(Icons.search), GestureDetector, IconButton, TextField;
}
