import 'package:auth/pages/login_page.dart';
import 'package:auth/pages/register_page.dart';
import 'package:flutter/material.dart';

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() =>
      _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  bool showLoginPage = true;

  void togglePages() {
    print("Tap");
    showLoginPage = !showLoginPage;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(onTap: togglePages);
    } else {
      return RegisterPage(onTap: togglePages);
    }
  }
}
