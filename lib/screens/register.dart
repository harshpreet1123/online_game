import 'package:flutter/material.dart';
import 'package:online_game/widgets/customButtons.dart';
import 'package:online_game/widgets/customTextField.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  handleSignin(){
      Navigator.pushNamedAndRemoveUntil(context, '/sports', (route) => false);
    }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          customTextField(context, 'Email', Icons.email, emailController),
          const SizedBox(
            height: 20,
          ),
          customTextField(context, 'Name', Icons.person_2, nameController),
          const SizedBox(
            height: 20,
          ),
          customTextField(
              context, 'Password', Icons.lock, passwordController),
          const SizedBox(
            height: 20,
          ),
          
          const SizedBox(
            height: 20,
          ),
          customButton(
              context: context,
              buttonColor: Colors.blue,
              text: 'Sign up',
              textColor: Colors.white,
              onTap: handleSignin)
        ],
      ),
    );
  }
}
