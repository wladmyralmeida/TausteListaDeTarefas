import 'package:flutter/material.dart';
import 'package:todoapp/app/model/tarefa_model.dart';
import 'package:todoapp/widgets/custom_text_field.dart';

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
  final _form = GlobalKey<FormState>();

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
                  backgroundImage: NetworkImage(
                      'https://i.fbcd.co/products/resized/resized-750-500/d4c961732ba6ec52c0bbde63c9cb9e5dd6593826ee788080599f68920224e27d.jpg'),
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxtparQeAnR6iyIHuXktc_785DhjtXdLLRIQ&s'),
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxtparQeAnR6iyIHuXktc_785DhjtXdLLRIQ&s'),
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
                itemCount: tarefas.length,
                itemBuilder: (context, index) {
                  final tarefa =
                      tarefas[index]; // usa diretamente o modelo existente

                  return ListTile(
                    title: Text(tarefa.titulo),
                    subtitle: Text(tarefa.descricao),
                    trailing: IconButton(
                      onPressed: () => _removeTarefa(index),
                      icon: const Icon(Icons.delete),
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

    //Removendo o Index da Lista;
    // setState(() {
    //   tarefas.removeAt(index);
    // });
  }

  // ToDo: Fazer a Filtragem da Tarefa na Lista pelo titulo dela.
  // _filtrarTarefa(){}
}
