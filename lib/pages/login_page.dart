import 'package:app_lanchonete/home.dart';
import 'package:app_lanchonete/pages/cadastrar_page.dart';
import 'package:flutter/material.dart';

import '../helpers/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  void loginUser() async {
    // FocusManager.instance.primaryFocus?.unfocus(); -> tira o foco da tela do teclado
    if (_formKey.currentState!.validate()) {
      bool isLogado =
          await Auth.login(emailController.text, passwordController.text);

      if (isLogado) {
        if (context.mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const Home(),
            ),
          );
        }
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('usuário ou senha inválido'),
              backgroundColor: Colors.redAccent,
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/logotipo.png'),
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: 'E-mail'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Por favor, informe o e-mail";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Senha',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Por favor, informe a senha";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: loginUser,
                    child: const Text("Entrar"),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text('Não tem uma conta?'),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CadastrarPage(),
                      ),
                    );
                  },
                  child: const Text('Cadastre-se'),
                ),
                // InkWell(
                //   onTap: () {},
                //   child: const Text('Cadastre-se'),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
