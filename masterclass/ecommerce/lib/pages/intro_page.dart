import 'package:ecommerce/pages/home_page.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logo
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Image.asset("lib/images/logo.png"),
              ),

              const SizedBox(height: 48),

              Text(
                "Just do it",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),

              const SizedBox(height: 24),

              Text(
                "Brand new sneakers and kicks made with premium quality",
                style: TextStyle(color: Colors.grey, fontSize: 16),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 48),

              GestureDetector(
                onTap: () {
                  print("What the helly?");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (c) {
                        return HomePage();
                      },
                    ),
                  );
                  print("Hih?");
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: const Center(
                    child: Text(
                      "Shop now",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
