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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool hidePassword = true;
  double indicatorHeight = 4;

  String? validateField(String? value) {
    if (value!.isEmpty || value == '') {
      return 'Campo não pode ser vazio';
    }
    return null;
  }

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
          child: Column(
            children: [
              _CustomLinearProgressIndicator(height: indicatorHeight),
              SizedBox(height: 56 - indicatorHeight),
              Padding(
                padding: const EdgeInsets.only(left: 23, right: 23),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: validateField,
                        textInputAction: TextInputAction.next,
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'E-mail',
                          hintText: 'Insira seu e-mail',
                        ),
                      ),
                      const SizedBox(height: 34),
                      TextFormField(
                        validator: validateField,
                        textInputAction: TextInputAction.done,
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
                            if (_formKey.currentState!.validate()) {
                              FocusManager.instance.primaryFocus?.unfocus();
                              AuthEntity auth = AuthEntity(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                              );
                              await authNotifier.login(auth);
                            }
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
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomLinearProgressIndicator extends StatefulWidget {
  const _CustomLinearProgressIndicator({Key? key, required this.height})
      : super(key: key);

  final double height;

  @override
  State<_CustomLinearProgressIndicator> createState() =>
      _CustomLinearProgressIndicatorState();
}

class _CustomLinearProgressIndicatorState
    extends State<_CustomLinearProgressIndicator>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    _controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AuthNotifier authNotifier =
        Provider.of<AuthNotifier>(context, listen: false);
    return authNotifier.state == AuthState.loading
        ? SizedBox(
            height: widget.height,
            child: LinearProgressIndicator(value: _controller.value),
          )
        : SizedBox(height: widget.height);
  }
}
