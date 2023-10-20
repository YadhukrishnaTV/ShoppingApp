import 'package:flutter/material.dart';
import 'package:shopping/utils/color_const.dart';

class Saved extends StatelessWidget {
  const Saved({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: colorco.bgcolor,
        title: Text("Saved",
      style: TextStyle(color: const Color.fromARGB(255, 6, 6, 6),
      fontSize: 23,
      fontWeight: FontWeight.w800),),),
      body: Center(
        child: Text("No saved Items",style: TextStyle(
          color: Colors.black,fontSize: 20,
          fontWeight: FontWeight.w600
        ),),
      ),
    );
  }
}