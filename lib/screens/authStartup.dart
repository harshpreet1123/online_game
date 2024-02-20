import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:online_game/widgets/customButtons.dart';

class AuthStartup extends StatelessWidget {
  const AuthStartup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
       crossAxisAlignment: CrossAxisAlignment.end,
       mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.asset('assets/animations/authAnimation.json'),
          customButton(
              context: context,
              buttonColor: Colors.blue,
              text: 'Login',
              textColor: Colors.white,
              onTap:(){
                Navigator.pushNamed(context, '/login');
              }),
          const SizedBox(
            height: 20,
          ),
          customButton(
              context: context,
              buttonColor: const Color.fromARGB(255, 199, 227, 250),
              text: 'Signup',
              textColor: Colors.blue,
              onTap:(){
               Navigator.pushNamed(context, '/register');
              }),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}
