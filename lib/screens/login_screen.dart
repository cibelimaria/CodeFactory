import 'package:code_factory/screens/home_screen.dart';
import 'package:code_factory/screens/sign_up_screen.dart';
import 'package:code_factory/widgets/custom_%20button_orange.dart';
import 'package:flutter/material.dart';

import '../widgets/text_field_login.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: ListView(shrinkWrap: true, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset('assets/images/login.png'),
                const SizedBox(height: 16),
                _loginText(),
                const SizedBox(height: 8),
                _text(FontWeight.w400, 'Login with social networks'),
                const SizedBox(height: 8),
                _socialButton(),
                const SizedBox(height: 16),
                TextFieldLogin(
                  labelText: 'Email',
                  controller: _emailController,
                ),
                const SizedBox(height: 16),
                TextFieldLogin(
                  labelText: 'Senha',
                  controller: _passwordController,
                  isPassword: true,
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () {},
                  child: _text(FontWeight.w500, 'Forgot Password?'),
                ),
                const SizedBox(height: 16),
                OrangeButton(
                  text: 'Log in',
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
                  },
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SignUp()));
                  },
                  child: _text(FontWeight.w500, 'Sign up'),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  Widget _loginText() {
    return const Center(
      child: Text(
        'Login',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
          color: Color(0xFF3C3A36),
        ),
      ),
    );
  }

  Widget _socialButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buttonLogin('assets/buttons/facebook.png'),
        const SizedBox(width: 12),
        _buttonLogin('assets/buttons/instagram.png'),
        const SizedBox(width: 12),
        _buttonLogin('assets/buttons/google.png'),
      ],
    );
  }

  Widget _buttonLogin(String image) {
    return GestureDetector(
      onTap: () {},
      child: Image.asset(image),
    );
  }

  Widget _text(FontWeight fontWeight, String text) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
            fontSize: 14,
            fontWeight: fontWeight,
            color: const Color(0xFF78746D)),
      ),
    );
  }
}
