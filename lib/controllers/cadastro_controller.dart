import 'dart:convert';

import 'package:http/http.dart' as http;

class CadastroController {
  static validarEmail(String email) {
    if (email.isEmpty) {
      return 'Campo obrigatório';
    }
    if (!email.contains('@')) {
      return 'Formato de email inválido';
    }
    for (int i = 0; i < email.length; i++) {
      if (!email[i].contains(RegExp(r'[a-z]')) &&
          email[i] != '_' &&
          email[i] != '.' &&
          email[i] != '@') {
        return 'Email contém caractéres inválidos';
      }
    }

    return null;
  }

  static validarApelidoOuNome(String value) {
    if (value.isEmpty) {
      return 'Campo obrigatório';
    }
    for (int i = 0; i < value.length; i++) {
      if (!value[i].contains(RegExp(r'[a-z]')) &&
          !value[i].contains(RegExp(r'[A-Z]')) &&
          value[i] != ' ') {
        return 'Nome contém caractéres inválidos';
      }
    }

    if (value.contains(' ')) {
      List nomeApelidoEmLista = value.split(' ');
      for (int i = 0; i < nomeApelidoEmLista.length; i++) {
        for (int e = 1; e < nomeApelidoEmLista[i].length; e++) {
          if (!nomeApelidoEmLista[i][0].contains(RegExp(r'[A-Z]'))) {
            return 'Primeira letra de cada nome deve ser maiúscula';
          }
          if (!nomeApelidoEmLista[i][e].contains(RegExp(r'[a-z]'))) {
            return 'Primeira letra de cada nome maiúscula, demais minúsculas';
          }
        }
      }
    } else {
      for (int i = 1; i < value.length; i++) {
        if (!value[0].contains(RegExp(r'[A-Z]'))) {
          return 'Primeira letra de cada nome deve ser maiúscula';
        }
        if (!value[i].contains(RegExp(r'[a-z]'))) {
          return 'Primeira letra de cada nome maiúscula, demais minúsculas';
        }
      }
    }

    return null;
  }

  static validarSenha(String senha) {
    int nums = 0;
    int letrasMaiusculas = 0;
    int letrasMinusculas = 0;

    if (senha.isEmpty) {
      return 'Campo obrigatório';
    }

    if (senha.length < 8) {
      return 'Mínimo 8 caracteres';
    }

    for (int i = 0; i < senha.length; i++) {
      if (!senha[i].contains(RegExp(r'[0-9]')) &&
          !senha[i].contains(RegExp(r'[a-z]')) &&
          !senha[i].contains(RegExp(r'[A-Z]')) &&
          senha[i] != '_' &&
          senha[i] != '.') {
        return 'Senha contém caracteres inválidos';
      }

      if (senha[i].contains(RegExp(r'[a-z]'))) {
        letrasMinusculas++;
      }
      if (senha[i].contains(RegExp(r'[A-Z]'))) {
        letrasMaiusculas++;
      }
      if (senha[i].contains(RegExp(r'[0-9]'))) {
        nums++;
      }
    }

    if (nums < 2) {
      return 'Minimo 2 números';
    }
    if (letrasMaiusculas < 1) {
      return 'Minimo 1 letra maiúscula';
    }
    if (letrasMinusculas < 1) {
      return 'Minimo 1 letra minúscula';
    }

    return null;
  }

  static validarConfirmarSenha(String senha, String confirmarSenha) {
    if (confirmarSenha.isEmpty) {
      return 'Campo obrigatório';
    }
    if (senha != confirmarSenha) {
      return 'As senhas não conferem';
    }
    return null;
  }

  static cadastrar(
    String nome,
    String email,
    String apelido,
    String senha,
  ) async {
    try {
      final url = Uri.parse('https://fredaugusto.com.br/simuladodrs/users');
      final req = http.MultipartRequest('POST', url);

      req.fields['nome_user'] = nome;
      req.fields['email_user'] = email;
      req.fields['senha_user'] = senha;
      req.fields['apelido_user'] = apelido;

      final res = await req.send();

      if (res.statusCode == 200) {
        final results = json.decode(await utf8.decodeStream(res.stream));
        return results['message'];
      } else {
        return 'Erro ao cadastrar, tente novamente';
      }
    } catch (e) {
      return 'Erro ao cadastrar, tente novamente';
    }
  }
}
