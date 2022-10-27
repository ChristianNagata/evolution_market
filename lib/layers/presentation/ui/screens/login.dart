import 'package:evolution_market/layers/domain/entities/auth_entity.dart';
import 'package:evolution_market/layers/presentation/controllers/auth_notifier.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthNotifier authNotifier = context.watch<AuthNotifier>();
    double screenWidth = MediaQuery.of(context).size.width;

    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return KeyboardDismisser(
      gestures: const [GestureType.onTap],
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: screenWidth / 1.8,
          centerTitle: true,
          title: const SizedBox(
            child: Image(
              image: AssetImage('assets/images/shopping-cart.png'),
            ),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/upper.bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 23, right: 23),
            child: Column(
              children: [
                const SizedBox(height: 56),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                    hintText: 'Insira seu e-mail',
                  ),
                ),
                const SizedBox(height: 34),
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Senha',
                    hintText: 'Insira sua senha',
                  ),
                ),
                const SizedBox(height: 47),
                FractionallySizedBox(
                  widthFactor: 1,
                  child: ElevatedButton(
                    onPressed: () async {
                      AuthEntity auth = AuthEntity(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                      );
                      await authNotifier.login(auth);
                    },
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(const Size(312, 40)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    child: const Text('Login'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
