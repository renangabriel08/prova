import 'package:flutter/material.dart';
import 'package:flutter_application/controllers/cadastro_controller.dart';
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
      final res = await CadastroController.cadastrar(
        nome,
        email,
        apelido,
        senha,
      );
      if (res == 'Usuário adicionado.') {
        Navigator.pushNamed(context, '/login');
      }
      MyToast.gerarToast(res);
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
          child: Form(
            key: _formKey,
            child: SizedBox(
              width: widthTela,
              height: heightTela,
              child: SingleChildScrollView(
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
                          validator: (value) =>
                              CadastroController.validarApelidoOuNome(
                            nome,
                          ),
                          onChanged: (value) => nome = value,
                          decoration: const InputDecoration(
                            label: Text('Nome'),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextFormField(
                          onChanged: (value) => email = value,
                          validator: (value) => CadastroController.validarEmail(
                            email,
                          ),
                          decoration: const InputDecoration(
                            label: Text('Email'),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextFormField(
                          validator: (value) =>
                              CadastroController.validarApelidoOuNome(
                            apelido,
                          ),
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
                          validator: (value) => CadastroController.validarSenha(
                            senha,
                          ),
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
                          validator: (value) =>
                              CadastroController.validarConfirmarSenha(
                            senha,
                            confirmarSenha,
                          ),
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
                          onPressed: () {
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
