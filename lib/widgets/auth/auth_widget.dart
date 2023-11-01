import 'package:flutter/material.dart';
import 'package:spider/spider.dart';
import '../main_screen/main_screen_widget.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({super.key});

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Login to your account')),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: const [
          _HeaderWidget(),
          _AuthForm(),
        ],
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget();

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 16,
      color: Colors.black,
    );
    return Column(
      children: const [
        SizedBox(
          height: 25,
        ),
        Text(
          'Google Книги — это наша попытка сделать содержание книг более доступным для поиска в Интернете. Используя API Google Книг, ваше приложение может выполнять полнотекстовый поиск и получать информацию о книгах, возможности просмотра и доступности электронных книг. Вы также можете управлять своими личными книжными полками. ',
          style: textStyle,
        ),
        SizedBox(
          height: 25,
        ),
        Text(
          'Embedded Viewer API позволяет встраивать предварительные просмотры Google Книг на свой веб-сайт и программно управлять этими предварительными просмотрами. ',
          style: textStyle,
        ),
        SizedBox(
          height: 25,
        ),
      ],
    );
  }
}

class _AuthForm extends StatefulWidget {
  const _AuthForm();

  @override
  State<_AuthForm> createState() => __AuthFormState();
}

class __AuthFormState extends State<_AuthForm> {
  final _loginTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  String? _errorTextLogin;
  String? _errorTextPassword;

  void _auth() {
    final login = _loginTextController.text;
    final password = _passwordTextController.text;

    _errorTextLogin = login.isEmpty ? 'Введите логин' : null;

    _errorTextPassword = password.isEmpty ? 'Введите пароль' : null;

    if (_errorTextLogin == null && _errorTextPassword == null) {
      Navigator.of(context).pushNamed('/main_screen');
    }

    setState(() {});
  }

  void _resetPassword() {
    // ignore: avoid_print
    print('reset password');
  }

  OutlineInputBorder _createNormalBorder(double width, Color color) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(1)),
      borderSide: BorderSide(width: width, color: color),
    );
  }

  @override
  Widget build(BuildContext context) {
    const normalColor = Color(0xFF01B4E4);
    const errorColor = Color.fromARGB(255, 219, 64, 3);

    const textStyle = TextStyle(
      fontSize: 16,
      color: Color(0xFF212529),
      fontWeight: FontWeight.w500,
    );

    const errorTextStyle = TextStyle(
      fontSize: 14,
      color: errorColor,
    );

    var textDecorationLogin = InputDecoration(
      border: _createNormalBorder(10, normalColor),
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      isCollapsed: true,
      enabledBorder: _createNormalBorder(1, normalColor),
      errorBorder: _createNormalBorder(1, errorColor),
      errorText: _errorTextLogin,
      errorStyle: errorTextStyle,
    );

    var textDecorationPassword = InputDecoration(
      border: _createNormalBorder(10, normalColor),
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      isCollapsed: true,
      enabledBorder: _createNormalBorder(1, normalColor),
      errorBorder: _createNormalBorder(1, errorColor),
      errorText: _errorTextPassword,
      errorStyle: errorTextStyle,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Username:',
          style: textStyle,
        ),
        const SizedBox(
          height: 5,
        ),
        TextField(
          decoration: textDecorationLogin,
          controller: _loginTextController,
        ),
        const SizedBox(
          height: 25,
        ),
        const Text(
          'Password:',
          style: textStyle,
        ),
        const SizedBox(
          height: 5,
        ),
        TextField(
          decoration: textDecorationPassword,
          obscureText: true,
          controller: _passwordTextController,
        ),
        const SizedBox(
          height: 25,
        ),
        Row(
          children: [
            ElevatedButton(
              onPressed: _auth,
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(normalColor)),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 25,
            ),
            TextButton(
              onPressed: _resetPassword,
              child: const Text(
                'Reset password',
                style: TextStyle(
                    color: normalColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
