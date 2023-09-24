import 'package:flutter/material.dart';
import 'package:flutter_application/controllers/login_controller.dart';
import 'package:flutter_application/widgets/MyToast.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _formKey = GlobalKey<FormState>();

  //Formulário
  String nome = '';
  String email = '';
  String apelido = '';
  String senha = '';
  String confirmarSenha = '';

  bool esconderSenha = true;
  IconData iconeSenha = Icons.visibility;

  bool esconderConfirmarSenha = true;
  IconData iconeConfirmarSenha = Icons.visibility;

  //funcões
  void revelarSenha() {
    setState(() {
      if (esconderSenha) {
        esconderSenha = false;
        iconeSenha = Icons.visibility_off;
      } else {
        esconderSenha = true;
        iconeSenha = Icons.visibility;
      }
    });
  }

  void revelarConfirmarSenha() {
    setState(() {
      if (esconderConfirmarSenha) {
        esconderConfirmarSenha = false;
        iconeConfirmarSenha = Icons.visibility_off;
      } else {
        esconderConfirmarSenha = true;
        iconeConfirmarSenha = Icons.visibility;
      }
    });
  }

  verificarCadastro() async {
    if (_formKey.currentState!.validate()) {
      print('Cadastrou');
    }
  }

  @override
  Widget build(BuildContext context) {
    //Tela
    double widthTela = MediaQuery.of(context).size.width;
    double heightTela = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: widthTela,
        height: heightTela,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: SizedBox(
                width: widthTela,
                height: heightTela - 40,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/logo.png',
                      height: 300,
                    ),
                    Column(
                      children: [
                        TextFormField(
                          onChanged: (value) => nome = value,
                          decoration: const InputDecoration(
                            label: Text('Nome'),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextFormField(
                          onChanged: (value) => email = value,
                          decoration: const InputDecoration(
                            label: Text('Email'),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextFormField(
                          onChanged: (value) => apelido = value,
                          decoration: const InputDecoration(
                            label: Text('Apelido'),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextFormField(
                          obscureText: esconderSenha,
                          onChanged: (value) => senha = value,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () => revelarSenha(),
                              icon: Icon(iconeSenha),
                            ),
                            label: const Text('Senha'),
                            border: const OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextFormField(
                          obscureText: esconderConfirmarSenha,
                          onChanged: (value) => confirmarSenha = value,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () => revelarConfirmarSenha(),
                              icon: Icon(iconeConfirmarSenha),
                            ),
                            label: const Text('Confirmar Senha'),
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            verificarCadastro();
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(widthTela, 50),
                          ),
                          child: const Text(
                            'Cadastrar',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        const SizedBox(height: 5),
                        OutlinedButton(
                          onPressed: () => Navigator.pushNamed(
                            context,
                            '/login',
                          ),
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(widthTela, 50),
                          ),
                          child: const Text(
                            'Voltar',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
