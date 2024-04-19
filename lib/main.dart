import 'package:flutter/material.dart';
import 'package:tipcalculator/views/anasayfa.dart';
import 'package:tipcalculator/views/hakkimizda.dart';

final Color AnaRenk = Color.fromARGB(255, 102, 16, 242);

// ignore: prefer_const_constructors
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/', // Başlangıç rotası
      routes: {
        '/': (context) => AnaSayfa(), // Ana sayfa rotası
        '/ayarlar': (context) => HakkimizdaWiews(), // İkinci sayfa rotası
      },
      
    );
  }
}