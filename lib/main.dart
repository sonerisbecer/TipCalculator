import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tipcalculator/models/hesaplama.dart';
import 'package:http/http.dart' as http;

const Color AnaRenk = Color.fromARGB(255, 102, 16, 242);


// ignore: prefer_const_constructors
void main() => runApp(MyApp());

 // Renkler


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      initialRoute: '/', // Başlangıç rotası
      routes: {
        '/': (context) => AnaSayfa(), // Ana sayfa rotası
        '/second': (context) => SecondPage(), // İkinci sayfa rotası
      },
    );
  }
  
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('İkinci Sayfa'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Bir önceki sayfaya geri dön
            Navigator.pushNamed(context, '/');
          },
          child: Text('Go Back'),
        ),
      ),
    );
  }
}

class AnaSayfa extends StatelessWidget{

  final double sonuc = Hesaplama(55, 5335, 33).hesapla();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fast Tip Calculator",),
          backgroundColor: AnaRenk,
          foregroundColor: Colors.white,
      ),
      body: AnaSayfaBody(),
        
    );
    
  }
  
  Widget AnaSayfaBody() {
  return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 10), // Üst kısmına 10 birim boşluk ekler
              BaslikContainer(
                baslik: "Tip Calculator",
                child: Text("Başlık"),
              ),
              IcerikContainer(
                child: MyForm(),
              ),
              BaslikContainer(
                baslik: "Sonuç",
                child: Text("Başlık"),
              ),
              IcerikContainer(
                child: Text("fgg"),
              ),
              BaslikContainer(
                baslik: "Sonuç",
                child: Text("Başlık"),
              ),
              IcerikContainer(
                child: Text("fgg"),
              ),
            ],
          );
 }
}

class BaslikContainer extends StatelessWidget {
  final Widget child;
  final String baslik;

  BaslikContainer({Key? key, required this.child, required this.baslik}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width, // Ekranın genişliğiyle aynı
        constraints: BoxConstraints(maxWidth: 400), // Maksimum genişlik 400
        padding: EdgeInsets.only(top:15, bottom: 15, left:10, right:10),
        margin: EdgeInsets.only(bottom: 0, left: 10, right: 10),
        decoration: BoxDecoration(
          color: Color.fromARGB(3, 0, 0, 0),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
          ),
          border: Border.all(color: Color.fromARGB(255, 225, 225, 225), width: 1.0),
        ),
        child: Text(
          baslik,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins', // veya kullandığınız fontun adı
          ),
        ),
      );
  }
}

class IcerikContainer extends StatelessWidget {
  final Widget child;

  IcerikContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width, // Ekranın genişliğiyle aynı
      constraints: BoxConstraints(maxWidth: 400), // Maksimum genişlik 400
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
      decoration: BoxDecoration( 
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
          bottomLeft: Radius.circular(5),
          bottomRight: Radius.circular(5),
        ),
        border: Border.all(color: Color.fromARGB(255, 225, 225, 225), width: 1.0),
      ),
      child: child,
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {

  
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.number, // Sadece sayısal klavye
                cursorWidth: 1,
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Price',
                  border: OutlineInputBorder(),
                  hintText: 'Enter the amount to be calculated.', // Placeholder metni
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontFamily: "Poppins"
                  )
               ),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly // Sadece sayıları kabul eder
                ],
              ),
              Text("234")
            ]
            
          ),
          
          SizedBox(height: 20),
          TextFormField(
            controller: _surnameController,
            decoration: InputDecoration(
              labelText: '%',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Form işlemleri buraya gelecek
              String name = _nameController.text;
              String surname = _surnameController.text;
              print('Ad: $name, Soyad: $surname');
              // İkinci sayfaya geçiş yap
              Navigator.pushNamed(context, '/second');
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.black26; // Basıldığında arka plan rengi yeşil olacak
                }
                return Colors.yellow; // Basılmadığında arka plan rengi sarı olacak
              }),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black), // Yazı rengi siyah
            ),
            child: Text('Hesapla'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    super.dispose();
  }
}


Future<void> getUsers() async {
  final response = await http.get(Uri.parse('http://localhost:3000/users'));
  if (response.statusCode == 200) {
    // İstek başarılı oldu, verileri işle
    print(response.body);
  } else {
    // İstek başarısız oldu, hata mesajını göster
    print('Request failed with status: ${response.statusCode}');
  }
}

Future<void> getDataFromAPI() async {
  try {
    // Yerel JSON dosyasının yolu
    String localJsonPath = 'assets/data.json';

    // Uzak API'nin URL'si
    String apiUrl = 'https://api.example.com/data';

    // Yerel JSON dosyasını oku
    File localFile = File(localJsonPath);
    print('Yerel JSON dosyası okundu.');

    // Uzak API'den veri al
    http.Response response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      String apiData = response.body;
      print('Uzak API\'den veri alındı.');

      // Yerel JSON dosyasını güncelle
      await localFile.writeAsString(apiData);
      print('Yerel JSON dosyası güncellendi.');
    } else {
      throw Exception('API\'den veri alınamadı.');
    }
  } catch (e) {
    print('Bir hata oluştu: $e');
    throw Exception('Veri güncelleme işlemi başarısız.');
  }
}