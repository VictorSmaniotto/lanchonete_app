import 'package:app_lanchonete/helpers/auth.dart';
import 'package:app_lanchonete/pages/cesta_page.dart';
import 'package:app_lanchonete/pages/favoritos_page.dart';
import 'package:app_lanchonete/pages/home_page.dart';
import 'package:app_lanchonete/pages/conta_page.dart';
import 'package:app_lanchonete/pages/pedidos_page.dart';
import 'package:app_lanchonete/widgets/menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _paginaIndex = 0;

  @override
  void initState() {
    super.initState();
    Auth.testeLogin(context);
  }

  final List<Widget> paginas = [
    const HomePage(),
    const CestaPage(),
    const FavoritosPage(),
    const PedidosPage(),
    const ContaPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/logotipo.png',
          height: 40,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
                onPressed: () async {
                  var whatsappUrl = "https://google.com";

                  if (!await launchUrl(Uri.parse(whatsappUrl))) {
                    throw 'Could not launch $whatsappUrl';
                  }
                },
                icon: SvgPicture.asset(
                  'assets/whatsapp48.svg',
                  height: 30,
                  colorFilter: const ColorFilter.mode(
                      Color(0xFF34af23), BlendMode.srcIn),
                )),
          ),
        ],
      ),
      drawer: const MenuDrawer(),
      body: paginas[_paginaIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _paginaIndex,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.white,
        elevation: 0,
        iconSize: 30,
        onTap: (index) {
          setState(() {
            _paginaIndex = index;
          });

          // debugPrint(index.toString());
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: "Cesta",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_outlined),
            label: "Favorito",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_outlined),
            label: "Pedido",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Conta",
          ),
        ],
      ),
    );
  }
}
