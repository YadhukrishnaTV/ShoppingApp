import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/controller/provider/myprovider.dart';
import 'package:shopping/view/spalsh/splash.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => myprovider(),
      child: MaterialApp(
       home: splashscreen(),
      ),
    );
  }
}

