import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

String getUsernameErrorMessage(String text) {
  if (text.trim().isEmpty) {
    return 'O campo de usuário não pode estar vazio.';
  } else if (text.length > 20) {
    return 'A campo não pode ter mais de 20 caracteres.';
  } else if (text.endsWith(' ')) {
    return 'O campo não pode terminar com espaço.';
  }
  return '';
}

String getPasswordErrorMessage(String text) {
  if (text.trim().isEmpty) {
    return 'O campo de senha não pode estar vazio.';
  } else if (text.length < 2) {
    return 'A senha não pode ter menos de 2 caracteres.';
  } else if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(text)) {
    return 'A senha só pode conter letras e números.';
  } else if (text.length > 20) {
    return 'A senha não pode ter mais de 20 caracteres.';
  } else if (text.endsWith(' ')) {
    return 'A senha não pode terminar com espaço.';
  }
  return '';
}

void launchURL() async {
  const url = 'https://www.google.com.br';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

void showAddItemDialog(
    BuildContext context, Function function, TextEditingController controller) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'Insira o texto do item',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                function();

                Navigator.pop(context);
              },
              child: const Text('Adicionar'),
            ),
          ],
        ),
      );
    },
  );
}
