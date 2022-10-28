import 'package:evolution_market/layers/domain/entities/auth_entity.dart';
import 'package:evolution_market/layers/presentation/controllers/auth_notifier.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    AuthNotifier authNotifier =
        Provider.of<AuthNotifier>(context, listen: false);

    return KeyboardDismisser(
        gestures: const [GestureType.onTap],
        child: Scaffold(
          key: authNotifier.key,
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
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'E-mail',
                      hintText: 'Insira seu e-mail',
                    ),
                  ),
                  const SizedBox(height: 34),
                  TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.text,
                    obscureText: hidePassword,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      hintText: 'Insira sua senha',
                      suffixIconColor: Theme.of(context).primaryColor,
                      suffixIcon: GestureDetector(
                        onTap: () =>
                            setState(() => hidePassword = !hidePassword),
                        child: hidePassword
                            ? const Icon(Icons.visibility_off_outlined)
                            : const Icon(Icons.visibility_outlined),
                      ),
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
                        minimumSize:
                            MaterialStateProperty.all(const Size(312, 40)),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).primaryColor,
                        ),
                      ),
                      child: const Text('Login'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
