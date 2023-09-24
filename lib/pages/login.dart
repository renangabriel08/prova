import 'package:flutter/material.dart';
import 'package:flutter_application/controllers/login_controller.dart';
import 'package:flutter_application/widgets/MyToast.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  //Formulário
  String email = '';
  String senha = '';

  bool esconder = true;
  IconData icone = Icons.visibility;

  //funcões
  void revelarSenha() {
    setState(() {
      if (esconder) {
        esconder = false;
        icone = Icons.visibility_off;
      } else {
        esconder = true;
        icone = Icons.visibility;
      }
    });
  }

  verificarLogin() async {
    if (_formKey.currentState!.validate()) {
      var res = await LoginController.logar(
        email,
        senha,
      );
      if (res['logou']) {
        Navigator.pushNamed(context, '/inicio');
      }
      MyToast.gerarToast(res['msg']);
    }
  }

  @override
  Widget build(BuildContext context) {
    //Tela
    double widthTela = MediaQuery.of(context).size.width;
    double heightTela = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SizedBox(
        width: widthTela,
        height: heightTela,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: SizedBox(
              width: widthTela,
              height: heightTela - 40,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/logo.png',
                      height: heightTela * .5,
                    ),
                    Column(
                      children: [
                        TextFormField(
                          onChanged: (value) => email = value,
                          validator: (value) => LoginController.validarDados(
                            email,
                          ),
                          decoration: const InputDecoration(
                            label: Text('Email'),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextFormField(
                          obscureText: esconder,
                          onChanged: (value) => senha = value,
                          validator: (value) => LoginController.validarDados(
                            senha,
                          ),
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () => revelarSenha(),
                              icon: Icon(icone),
                            ),
                            label: const Text('Senha'),
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
                            verificarLogin();
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(widthTela, 50),
                          ),
                          child: const Text(
                            'Entrar',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        const SizedBox(height: 5),
                        OutlinedButton(
                          onPressed: () => Navigator.pushNamed(
                            context,
                            '/cadastro',
                          ),
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(widthTela, 50),
                          ),
                          child: const Text(
                            'Cadastrar',
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
