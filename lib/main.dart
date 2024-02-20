import 'package:flutter/material.dart';
import 'package:online_game/provider/appProvider.dart';
import 'package:online_game/screens/authStartup.dart';
import 'package:online_game/screens/gameHistory.dart';
import 'package:online_game/screens/homeScreen.dart';
import 'package:online_game/screens/loginScreen.dart';
import 'package:online_game/screens/register.dart';
import 'package:online_game/screens/splashScreen.dart';
import 'package:online_game/screens/sports.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => AppProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/auth': (context) => const AuthStartup(),
        '/register': (context) => const RegisterScreen(),
        '/login': (context) => const LoginScreen(),
        '/sports': (context) => const Sports(),
        '/home': (context) => const HomeScreen(),
        '/history':(context) => const GameHistory()
      },
    );
  }
}
