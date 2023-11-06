import 'package:flutter/material.dart';
import 'package:targettest/auth/widgets/botton_auth.dart';
import 'package:targettest/auth/widgets/text_form_filed_pattern.dart';
import 'package:targettest/core/utils.dart';
import 'package:targettest/home/home_page.dart';

class AuthBody extends StatefulWidget {
  const AuthBody({Key? key}) : super(key: key);

  @override
  AuthBodyState createState() => AuthBodyState();
}

class AuthBodyState extends State<AuthBody> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String usernameErrorText = '';
  String passwordErrorText = '';

  void _checkFieldsAndNavigate() {
    setState(() {
      usernameErrorText = getUsernameErrorMessage(_usernameController.text);
      passwordErrorText = getPasswordErrorMessage(_passwordController.text);
    });

    if (usernameErrorText.isEmpty && passwordErrorText.isEmpty) {
      Navigator.pushNamed(context, HomePage.route);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 22, 54, 78),
            Color.fromARGB(255, 39, 133, 124)
          ],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Column(
              children: [
                TextFormFieldPattern(
                  icon: const Icon(Icons.person),
                  text: 'Usuário',
                  controller: _usernameController,
                  isValid: _usernameController.text.trim().isNotEmpty,
                  errorMessage: usernameErrorText,
                ),
                TextFormFieldPattern(
                  icon: const Icon(Icons.lock),
                  text: 'Senha',
                  controller: _passwordController,
                  isValid: _passwordController.text.trim().isNotEmpty &&
                      _passwordController.text.length >= 2 &&
                      RegExp(r'^[a-zA-Z0-9]+$')
                          .hasMatch(_passwordController.text) &&
                      _passwordController.text.length <= 20 &&
                      !_passwordController.text.endsWith(' '),
                  errorMessage: passwordErrorText,
                ),
                ButtonAuth(
                  onPressed: _checkFieldsAndNavigate,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: GestureDetector(
                onTap: launchURL,
                child: const Text(
                  'Política de Privacidade',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
