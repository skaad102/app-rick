import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/* Login ficticion user = admin; password = admin */
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: FormLogin(),
    ));
  }
}

class FormLogin extends StatelessWidget {
  const FormLogin({
    super.key,
  });

  final inputDecoration = const InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    hintText: 'admin',
  );

  void login(String user, String password, BuildContext context) {
    if (user == 'admin' && password == 'admin') {
      context.go('/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Usuario o password incorrecto'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final texPassword = TextEditingController();
    final texUser = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: const Key('login_form'),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: texUser,
              decoration: inputDecoration,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Ingrese un usuario';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: texPassword,
              obscureText: true,
              decoration: inputDecoration,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Ingrese un password';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                login(texUser.text, texPassword.text, context);
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
