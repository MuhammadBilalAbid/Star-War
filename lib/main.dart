import 'package:flutter/material.dart';
import 'package:star_wars/provider/CharacterProvider.dart';
import 'package:star_wars/view/HomeScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const StarWars());
}

class StarWars extends StatelessWidget {
  const StarWars({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CharacterProvider()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFF009487),
              foregroundColor: Colors.white,
            ),
          ),
          home: const Homescreen()),
    );
  }
}
