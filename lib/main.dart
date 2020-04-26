import 'package:flutter/material.dart';
import 'package:video_game_ui/pages/loading_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Game',
      debugShowCheckedModeBanner: false,
      home: LoadingPage(),
    );
  }
}
