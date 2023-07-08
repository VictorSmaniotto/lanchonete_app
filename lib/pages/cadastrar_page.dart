import 'dart:convert';
import 'dart:io';

import 'package:app_lanchonete/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import '../helpers/api_url.dart';

class CadastrarPage extends StatefulWidget {
  const CadastrarPage({super.key});

  @override
  State<CadastrarPage> createState() => _CadastrarPageState();
}

class _CadastrarPageState extends State<CadastrarPage> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmaPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  XFile? _avatarImagem;

  void _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickerImage = await picker.pickImage(source: source);

    if (pickerImage != null) {
      setState(() {
        _avatarImagem = XFile(pickerImage.path);
      });
    }
  }

  void _showImagePicker() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return SafeArea(
              child: SizedBox(
            height: 150,
            child: Wrap(
              children: [
                ListTile(
                  title: const Text('Câmera'),
                  leading: const Icon(Icons.camera),
                  onTap: () {
                    Navigator.of(context).pop();
                    _pickImage(ImageSource.camera);
                  },
                ),
                ListTile(
                  title: const Text('Galeria'),
                  leading: const Icon(Icons.photo),
                  onTap: () {
                    Navigator.of(context).pop();
                    _pickImage(ImageSource.gallery);
                  },
                ),
              ],
            ),
          ));
        });
  }

  void cadastrarUser() async {
    if (_formKey.currentState!.validate()) {
      var request = http.MultipartRequest(
          'POST', Uri.parse("${ApiUrl.baseUrl}/cadastrar"));
      request.fields['nome'] = nomeController.text;
      request.fields['email'] = emailController.text;
      request.fields['password'] = passwordController.text;

      if (_avatarImagem != null) {
        request.files.add(
            await http.MultipartFile.fromPath("imagem", _avatarImagem!.path));
      }

      var response = await request.send();
      var streamedResponse = await http.Response.fromStream(response);
      debugPrint(streamedResponse.body);

      var jsonData = jsonDecode(streamedResponse.body);
      // debugPrint(jsonData['errors'][0]);

      if (streamedResponse.statusCode == 200) {
        if (context.mounted) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Cadastro Realizado'),
                  content: const Text('Usuário cadastrado com sucesso!'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); //fecha o alerta
                        Navigator.of(context).pop(); // fecha o cadastrar
                      },
                      child: const Text('OK'),
                    )
                  ],
                );
              });
        }
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                  "Ocorreu um erro durante o cadastro, por favor tente novamente mais tarde"),
              // content: Text(jsonData['erros'][0]),
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
        title: const Text('Cadastrar'),
      ),
      body: ListView(
        children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: _showImagePicker,
                    child: (_avatarImagem == null)
                        ? Container(
                            width: 100,
                            height: 100,
                            decoration: const BoxDecoration(
                                color: Colors.grey, shape: BoxShape.circle),
                            child: const Icon(
                              Icons.add_a_photo,
                              color: Colors.white,
                              size: 50,
                            ),
                          )
                        : Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: FileImage(File(_avatarImagem!.path))),
                            ),
                          ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: nomeController,
                    decoration: const InputDecoration(labelText: 'Nome'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Por favor, informe o nome completo";
                      }
                      return null;
                    },
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
                    decoration: const InputDecoration(labelText: 'Senha'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Por favor, informe a senha";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: confirmaPasswordController,
                    obscureText: true,
                    decoration:
                        const InputDecoration(labelText: 'Confirme sua Senha'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Por favor, informe a senha novamente";
                      } else if (value != passwordController.text) {
                        return "As senhas não coincidem";
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
                      onPressed: cadastrarUser,
                      child: const Text('Cadastrar'),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text('Já tem uma conta?'),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    child: const Text('Login'),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
