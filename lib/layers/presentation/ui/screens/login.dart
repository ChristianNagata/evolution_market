import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: const [GestureType.onTap],
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 202,
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
        body: Padding(
          padding: const EdgeInsets.only(left: 23, right: 23),
          child: Column(
            children: [
              const SizedBox(height: 56),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                  hintText: 'Insira seu e-mail',
                ),
              ),
              const SizedBox(height: 34),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Senha',
                  hintText: 'Insira sua senha',
                ),
              ),
              const SizedBox(height: 47),
              FractionallySizedBox(
                widthFactor: 1,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(312, 40)),
                  ),
                  child: const Text('Login'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
