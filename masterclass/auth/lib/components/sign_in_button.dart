import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    super.key,
    required this.text,
    required this.onTap,
  });
  final void Function() onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 158, vertical: 25),
        margin: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          "Sign In",
          style: TextStyle(
            color: Colors.grey[100],
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
