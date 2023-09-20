import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    double widthTela = MediaQuery.of(context).size.width;
    double heightTela = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: widthTela,
        height: heightTela,
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                Column(
                  children: [
                    TextFormField(),
                    TextFormField(),
                  ],
                ),
                Column(
                  children: [
                    ElevatedButton(onPressed: (){}, child: const Text('Entrar'),),
                    OutlinedButton(onPressed: (){}, child: const Text('Cadastrar'))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
