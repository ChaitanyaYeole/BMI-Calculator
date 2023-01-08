import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() {
  runApp(const Display1());
}

class Display1 extends StatelessWidget {
  const Display1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xff090C22),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xff090C22),
        ),
      ),
      home: const InputPage(),
    );
  }
}
