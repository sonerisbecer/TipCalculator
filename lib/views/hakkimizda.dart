import 'package:flutter/material.dart';

final Color AnaRenk = Color.fromARGB(255, 102, 16, 242);

bool notificationEnabled = true;
bool darkModeEnabled = false;
String selectedLanguage = 'English';


class HakkimizdaWiews extends StatefulWidget {
  const HakkimizdaWiews({super.key});

  @override
  State<HakkimizdaWiews> createState() => _HakkimizdaWiewsState();
}

class _HakkimizdaWiewsState extends State<HakkimizdaWiews> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 
        Row(children: [
          Icon(Icons.settings),
          SizedBox(width: 10),
          Text("Hakkımızda"),
        ],
        ),
        backgroundColor: AnaRenk,
        foregroundColor: Colors.white,
        
      ),
      body: SayfaBody(),
        
    );
  }
  
  SayfaBody() {

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Bu uygulama www.xycalculator.com tarafından yapılmıştır.",
          
          ),
          SizedBox(height: 10),
          Text("v.1.0")
        ]
        ),
    );


  }
}