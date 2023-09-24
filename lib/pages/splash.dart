import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    double heightTela = MediaQuery.of(context).size.height;
    Future.wait([Future.delayed(const Duration(seconds: 3))]).then(
      (value) => Navigator.pushNamed(context, '/login'),
    );
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image.asset(
                      'assets/logo.png',
                      height: heightTela * .5,
                    ),
                    const Text(
                      'GoGo Trip',
                      style: TextStyle(
                        fontSize: 40,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const CircularProgressIndicator(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
