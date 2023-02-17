import 'package:apptestfy/controllers/login_controller.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final _controller = LoginController();
  LoginPage({super.key});

  SnackBar _errorSnack() {
    return const SnackBar(
      backgroundColor: Colors.red,
      duration: Duration(seconds: 4),
      content: Text('Erro ao efetuar o login!'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(
            color: Colors.black,
            width: 1.0,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.people,
              size: MediaQuery.of(context).size.height * 0.2,
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: "Login",
                hintText: "Enter your email or CPF",
              ),
              onChanged: _controller.setLogin,
            ),
            TextField(
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Senha",
                hintText: "Enter your password",
              ),
              onChanged: _controller.setPassword,
            ),
            const SizedBox(height: 20),
            ValueListenableBuilder<bool>(
                valueListenable: _controller.inLoader,
                builder: (context, snapshot, _) {
                  return Visibility(
                    visible: !snapshot,
                    replacement: const CircularProgressIndicator(),
                    child: ElevatedButton(
                      onPressed: () {
                        _controller.auth().then((value) {
                          if (value) {
                            Navigator.of(context).pushReplacementNamed('/home');
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(_errorSnack());
                          }
                        });
                      },
                      child: const Text("Login"),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
