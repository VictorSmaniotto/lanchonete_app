import 'package:flutter/material.dart';

class LocalizacaoPage extends StatefulWidget {
  const LocalizacaoPage({super.key});

  @override
  State<LocalizacaoPage> createState() => _LocalizacaoPageState();
}

class _LocalizacaoPageState extends State<LocalizacaoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Localização'),
      ),
      // body: ,
    );
  }
}
