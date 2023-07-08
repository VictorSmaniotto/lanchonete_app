import 'package:app_lanchonete/pages/lanchonete_page.dart';
import 'package:app_lanchonete/pages/localizacao_page.dart';
import 'package:flutter/material.dart';

import '../helpers/auth.dart';

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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LanchonetePage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.pin_drop),
                  title: const Text('Localização'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LocalizacaoPage(),
                      ),
                    );
                  },
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
                const Divider(),
                ListTile(
                  title: const Text('Sair'),
                  onTap: () {
                    Auth.logout(context);
                  },
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
