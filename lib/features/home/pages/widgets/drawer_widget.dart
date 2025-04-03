import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
    );
  }
}
