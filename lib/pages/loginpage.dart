import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final _tLogin = TextEditingController();
  final _tSenha = TextEditingController();

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
        child: _body(),
      ),
    );
  }

  _body() {
    return Form(
      child: ListView(
        children: <Widget>[
          TextFormField( //===================================== Login =========================
            controller: _tLogin,
            keyboardType: TextInputType.text,
            style: TextStyle(color: Colors.blue, fontSize: 25),
            decoration: InputDecoration(
                labelText: 'Login',
                labelStyle: TextStyle(color: Colors.black, fontSize: 25),
                hintText: 'Digite seu login',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 18)),
          ),
          TextFormField( //===================================== Senha =========================
            controller: _tSenha,
            obscureText: true,
            keyboardType: TextInputType.number,
            style: TextStyle(color: Colors.blue, fontSize: 25),
            decoration: InputDecoration(
                labelText: 'Senha',
                labelStyle: TextStyle(color: Colors.black, fontSize: 25),
                hintText: 'Digite sua senha',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 18)),
          ),
          Container( //========================================= Butão =========================
            margin: EdgeInsets.only(top: 20),
            height: 50,
            child: RaisedButton(
                color: Colors.blue,
                child: Text('Login',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                onPressed: _onClickLogin),
          )
        ],
      ),
    );
  }

  _onClickLogin() {
    print('Login');
  }
}
