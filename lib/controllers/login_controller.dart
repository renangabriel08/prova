import 'package:http/http.dart' as http;

class LoginController {
  static validarDados(value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }

  static logar(String email, String senha) async {
    final url = Uri.parse('https://fredaugusto.com.br/simuladodrs/token');
    final request = http.MultipartRequest('POST', url);

    request.fields['email'] = email;
    request.fields['senha'] = senha;

    final res = await request.send();
    print(res);
  }
}
