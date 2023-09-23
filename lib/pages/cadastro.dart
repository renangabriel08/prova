import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  @override
  Widget build(BuildContext context) {
    double widthTela = MediaQuery.of(context).size.width;
    double heightTela = MediaQuery.of(context).size.height;

    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Container(
        width: widthTela,
        height: heightTela,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Image.asset('assets/logo.png'),
                  Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text('Email'),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            print('Logou');
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(widthTela, 50),
                        ),
                        child: const Text(
                          'Entrar',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
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
    );
  }
}
