import 'package:flutter/material.dart';
import 'package:parcial2/paginas/home.dart';

void main() {
  runApp(Parcial());
}

class Parcial extends StatefulWidget {
  Parcial({Key? key}) : super(key: key);

  @override
  State<Parcial> createState() => _ParcialState();
}

class _ParcialState extends State<Parcial> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}