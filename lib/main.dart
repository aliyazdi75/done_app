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
        progressIndicatorTheme: ProgressIndicatorThemeData(
          linearTrackColor: Theme.of(context).canvasColor,
          color: accentColor,
        ),
        primarySwatch: primarySwatchColor,
      ),
      home: HomePage(),
    );
  }
}
