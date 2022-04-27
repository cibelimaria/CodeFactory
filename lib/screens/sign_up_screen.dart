import 'package:code_factory/screens/home_screen.dart';
import 'package:code_factory/widgets/custom_%20button_orange.dart';
import 'package:flutter/material.dart';

import '../widgets/text_field_login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late TextEditingController _emailController;
  late TextEditingController _nameController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _nameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body());
  }

  Widget _body() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset('assets/images/signup.png'),
                  const SizedBox(height: 16),
                  _text(
                      'Sign up', 24, FontWeight.w500, const Color(0xFF3C3A36)),
                  const SizedBox(height: 8),
                  _text('Create your account', 14, FontWeight.w400,
                      const Color(0xFF78746D)),
                  const SizedBox(height: 16),
                  TextFieldLogin(
                      labelText: 'Name', controller: _nameController),
                  const SizedBox(height: 16),
                  TextFieldLogin(
                      labelText: 'E-mail', controller: _emailController),
                  const SizedBox(height: 16),
                  TextFieldLogin(
                      labelText: 'Password',
                      controller: _passwordController,
                      isPassword: true),
                  const SizedBox(height: 16),
                  OrangeButton(
                      text: 'Sign up',
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                      }),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: _text(
                        'Log in', 14, FontWeight.w500, const Color(0xFF78746D)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _text(String text, double size, FontWeight bold, Color color) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: bold,
        ),
      ),
    );
  }
}
