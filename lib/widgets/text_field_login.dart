import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextFieldLogin extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final bool isPassword;

  const TextFieldLogin({
    Key? key,
    required this.labelText,
    required this.controller,
    this.isPassword = false,
  }) : super(key: key);

  @override
  _TextFieldLoginState createState() => _TextFieldLoginState();
}

class _TextFieldLoginState extends State<TextFieldLogin> {
  late bool _obscuredText;

  @override
  void initState() {
    _obscuredText = widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFBEBAB3))),
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: TextField(
          obscureText: _obscuredText,
          controller: widget.controller,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            suffixIcon: iconValidation(),
            labelStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF78746D)),
            labelText: widget.labelText,
            border: InputBorder.none,
          ),
          cursorColor: const Color(0xFF78746D),
        ),
      ),
    );
  }

  Widget _passwordIcon(String image) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 10.0,
      child: SvgPicture.asset(
        image,
        height: 12,
        width: 12,
      ),
    );
  }

  Widget iconValidation() {
    if (widget.isPassword == true) {
      return GestureDetector(
          onTap: () {
            setState(() {
              _obscuredText = !_obscuredText;
            });
          },
          child: _obscuredText
              ? _passwordIcon("assets/icons/icon_scratched_eye.svg")
              : _passwordIcon("assets/icons/icon_eye.svg"));
    } else {
      return const SizedBox.shrink();
    }
  }
}
