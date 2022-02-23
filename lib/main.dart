import 'package:flutter/material.dart';
import 'package:notebook_app/provider/notebook_provider.dart';
import 'package:notebook_app/screens/splash_screen.dart';
import 'package:provider/provider.dart';



void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<NoteBookProvider>(create: (context)=> NoteBookProvider(),
        ),
      ],
      child: NoteBookApp(),
    ),
  );
}

class NoteBookApp extends StatelessWidget {
  const NoteBookApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "NoteBook",
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.blueAccent,
      ),
      home: SplashScreen(),
    );
  }
}


