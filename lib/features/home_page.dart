import 'package:flutter/material.dart';
import 'package:todoapp/widgets/custom_text_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isChecked = false;

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
      body: const Column(
        children: [
          SizedBox(height: 16),
          CustomTextField(
            hintText: 'Digite o título',
            label: 'Título',
          ),
          SizedBox(height: 16),
          CustomTextField(
            hintText: 'Digite a descrição',
            label: 'Descrição',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        //footer
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
