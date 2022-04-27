import 'package:flutter/material.dart';

class OrangeButton extends StatefulWidget {
  final String text;
  final Function() onPressed;

  const OrangeButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  _OrangeButtonState createState() => _OrangeButtonState();
}

class _OrangeButtonState extends State<OrangeButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: ElevatedButton(
        onPressed: () => widget.onPressed(),
        child: Text(
          widget.text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(const Color(0xFFE3562A)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ),
    );
  }
}
