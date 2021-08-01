import 'package:done_app/screens/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'data/constants/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Done Application',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // bottomSheetTheme: ,
        // sliderTheme: ,
        progressIndicatorTheme: ProgressIndicatorThemeData(
          linearTrackColor: Theme.of(context).canvasColor,
          color: accentColor,
        ),
        // colorScheme: ColorScheme.light(
        //   surface: Colors.white,
        //   primary: primarySwatchColor,
        //   primaryVariant: Colors.blueGrey,
        //   secondary: Colors.orange,
        //   secondaryVariant: Colors.green,
        //   onPrimary: Colors.purple,
        //   onSecondary: Colors.amberAccent,
        //   brightness: Brightness.light,
        // ),
        primarySwatch: primarySwatchColor,
      ),
      home: HomePage(),
    );
  }
}
