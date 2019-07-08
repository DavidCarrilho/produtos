import 'package:flutter/material.dart';
import 'package:produtos/domain/login_services.dart';
import 'package:produtos/utils/alerts.dart';

class LoginPage extends StatelessWidget {
  // final _tLogin = TextEditingController(text: 'David');// Caso queria já passar um valor para esse campo
  final _tLogin = TextEditingController(text: ''); // pode usar assim
  final _tSenha = TextEditingController(); // ou sem nada
  final GlobalKey<FormState> _formKey = GlobalKey<
      FormState>(); // Com a key do form podemos criar functions para validar o login e senha

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Produtos'),
        centerTitle: true,
        leading: Icon(Icons.shopping_cart),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: _body(context),
      ),
    );
  }

  String _validateLogin(String text) {
    // =========================================
    if (text.isEmpty) {
      return 'Informe o login';
    }
    return null; // se tiver tudo ok
  }

  String _validateSenha(String text) {
    // =========================================
    if (text.isEmpty) {
      return 'Informe senha';
    }
    if (text.length <= 2) {
      return 'Senha precisar ter mais que 2 digitos';
    }
    return null; // se tiver tudo ok nao faz nada
  }

  _body(context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: <Widget>[
          TextFormField(
            //===================================== Login =========================
            controller: _tLogin,
            validator: _validateLogin,
            keyboardType: TextInputType.text,
            style: TextStyle(color: Colors.blue, fontSize: 25),
            decoration: InputDecoration(
                labelText: 'Login',
                labelStyle: TextStyle(color: Colors.black, fontSize: 25),
                hintText: 'Digite seu login',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 18)),
          ),
          TextFormField(
            //===================================== Senha =========================
            controller: _tSenha,
            validator: _validateSenha,
            obscureText: true,
            keyboardType: TextInputType.number,
            style: TextStyle(color: Colors.blue, fontSize: 25),
            decoration: InputDecoration(
                labelText: 'Senha',
                labelStyle: TextStyle(color: Colors.black, fontSize: 25),
                hintText: 'Digite sua senha',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 18)),
          ),
          Container(
              //========================================= Butão =========================
              margin: EdgeInsets.only(top: 20),
              height: 50,
              child: RaisedButton(
                  color: Colors.blue,
                  child: Text('Login',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  onPressed: () {
                    _onClickLogin(context);
                  }))
        ],
      ),
    );
  }

  _onClickLogin(BuildContext context) {
    final login = _tLogin.text;
    final senha = _tSenha.text;

    if (!_formKey.currentState.validate()) {
      // se nao estiver valido, mosta o alerta
      return;
    }

    // _tLogin.text = 'Jane'; // passando o valor em tempo de execução

    print('Login:  $login, Senha $senha');

    final ok = LoginService.login(login, senha);

    if (ok) {
      print('Entrar na Home');
    } else {
      alert(context, 'Erro!', 'Informe corretamente seu login e senha.');
    }
  }
}
