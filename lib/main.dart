import 'package:flutter/material.dart';
import 'package:undefeats/ui/screens/main_page/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UnDefeatsBT',
      theme: ThemeData(
        //define Themes Color, Font
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        fontFamily: 'Jersey',
        textTheme: const TextTheme(
          headline1: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.white30),
          headline6: TextStyle(fontSize: 24.0, fontStyle: FontStyle.italic),
          bodyText1: TextStyle(
            fontSize: 14.0,
          ),
        ),
      ),
      routes: {
        '/' : (ctx) => const MainPage(),
      },
    );
  }
}
