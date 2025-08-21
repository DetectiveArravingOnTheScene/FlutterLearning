import 'package:auth/components/my_text_field.dart';
import 'package:auth/components/sign_in_button.dart';
import 'package:auth/components/square_tile.dart';
import 'package:auth/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.onTap});

  final void Function() onTap;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController loginController =
      TextEditingController();

  final TextEditingController passwordController =
      TextEditingController();

  void signInUser() async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(child: CircularProgressIndicator());
      },
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: loginController.text,
        password: passwordController.text,
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showErrorMessage(e.code);
    }
  }

  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (c) {
        return AlertDialog(title: Text(message));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                Icon(Icons.lock, size: 100),
                SizedBox(height: 50),
                Text(
                  "Welcome back",
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 24,
                  ),
                ),

                SizedBox(height: 25),

                MyTextField(
                  controller: loginController,
                  hintText: "Login",
                  obscure: false,
                ),

                SizedBox(height: 25),

                MyTextField(
                  controller: passwordController,
                  hintText: "Password",
                  obscure: true,
                ),

                SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forgot Password?",
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10),

                SignInButton(text: "Sign In", onTap: signInUser),

                SizedBox(height: 50),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                  ),
                  child: Row(
                    children: [
                      Expanded(child: Divider()),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                        ),
                        child: Text(
                          "or continue with",
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(child: Divider()),
                    ],
                  ),
                ),

                SizedBox(height: 50),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(
                      imagePath: "lib/assets/google_logo.png",
                      onTap: () {
                        AuthService().signInWithGoogle();
                      },
                    ),
                    SizedBox(width: 25),
                    SquareTile(
                      imagePath: "lib/assets/apple_logo.png",
                      onTap: () {},
                    ),
                  ],
                ),

                SizedBox(height: 50),

                Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("Not a Member? "),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Text(
                          "Register Now",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
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
