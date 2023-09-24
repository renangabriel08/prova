import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginController {
  static validarDados(value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }

  static Future<Map> logar(String email, String senha) async {
    try {
      final url = Uri.parse('https://fredaugusto.com.br/simuladodrs/token');
      final request = http.MultipartRequest('POST', url);

      request.fields['email'] = email;
      request.fields['senha'] = senha;

      final res = await request.send();

      if (res.statusCode == 200) {
        final resposta = json.decode(await utf8.decodeStream(res.stream));
        return {
          "logou": true,
          "token": resposta['access_token'],
          "msg": 'Bem vindo'
        };
      } else {
        return {
          "logou": false,
          "token": '',
          "msg": 'Email/senha incorretos'
        };
      }
    } catch (e) {
      return {
        "logou": false,
        "token": '',
        "msg": 'Falha ao logar, tente mais tarde'
      };
    }
  }
}
