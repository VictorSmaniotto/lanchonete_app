import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                SizedBox(
                  height: 70,
                  child: DrawerHeader(
                    child: Image.asset(
                      'assets/logotipo.png',
                      height: 20,
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.fastfood_outlined),
                  title: const Text('Lanchonete'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.pin_drop),
                  title: const Text('Localização'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.contact_phone_outlined),
                  title: const Text('Contato'),
                  onTap: () {},
                ),
                const Divider(),
                ListTile(
                  title: const Text('Política de Privacidade'),
                  onTap: () {},
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Versão 1.0'),
          )
        ],
      ),
    );
  }
}
