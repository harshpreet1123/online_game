import 'package:flutter/material.dart';
import 'package:online_game/widgets/customButtons.dart';
import 'package:online_game/widgets/customTextField.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    handleLogin(){
      Navigator.pushNamedAndRemoveUntil(context, '/sports', (route) => false);
    }

    return Scaffold(
        appBar: AppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          customTextField(context, 'Email', Icons.email, emailController),
          const SizedBox(
            height: 20,
          ),
          customTextField(
              context, 'Password', Icons.lock, passwordController),
          const SizedBox(
            height: 20,
          ),
          customButton(
              context: context,
              buttonColor: Colors.blue,
              text: 'Log in',
              textColor: Colors.white,
              onTap: handleLogin)
        ]));
  }
}
