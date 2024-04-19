/* Ana Sayfa StataFul Widget */
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinbox/cupertino.dart';
import 'package:tipcalculator/styles/colors.dart';
import 'package:tipcalculator/views/hakkimizda.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.calculate),
            SizedBox(width: 10),
            Text("Fast Tip Calculator"),
            Container(
              child: Icon(Icons.abc),
            )
          ],
        ),
        actions: [
          IconButton(
              onPressed: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HakkimizdaWiews()))
                  },
              icon: Icon(Icons.info))
        ],
        backgroundColor: AppColors.app_bar_arka_plan_rengi,
        foregroundColor: AppColors.app_bar_yazi_rengi,
      ),
      body: AnaSayfaBody(),
    );
  }
}

Widget AnaSayfaBody() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      SizedBox(height: 10), // Üst kısmına 10 birim boşluk ekler
      Column(
        children: [
          BaslikContainer(
            baslik: "Tip Calculator",
            child: Text("Başlık"),
          ),
          IcerikContainer(
            child: MyForm(),
          ),
          Row(
            children: [
              Container(
                width: 180,
                constraints: BoxConstraints(maxWidth: 400), // Maksimum genişlik 400
                padding: EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
                margin: EdgeInsets.only(bottom: 0, left: 10, right: 10),
                decoration: BoxDecoration(
                color: Color.fromARGB(3, 0, 0, 0),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                ),
                  border: Border.all(
                      color: Color.fromARGB(255, 225, 225, 225), width: 1.0),
                ),
                child: Center(
                  child: Text(
                    "Tip %",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
               Container(
                width: 180,
                constraints: BoxConstraints(maxWidth: 400), // Maksimum genişlik 400
                padding: EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
                margin: EdgeInsets.only(bottom: 0, left: 10, right: 10),
                decoration: BoxDecoration(
                color: Color.fromARGB(3, 0, 0, 0),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                ),
                  border: Border.all(
                      color: Color.fromARGB(255, 225, 225, 225), width: 1.0),
                ),
                child: Center(
                  child: Text(
                    "Tip %",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),

        ],
      ),
    ],
  );
}
/* Ana Sayfa StataFul Widget */

class BaslikContainer extends StatelessWidget {
  final Widget child;
  final String baslik;

  BaslikContainer({Key? key, required this.child, required this.baslik})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width, // Ekranın genişliğiyle aynı
      constraints: BoxConstraints(maxWidth: 400), // Maksimum genişlik 400
      padding: EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
      margin: EdgeInsets.only(bottom: 0, left: 10, right: 10),
      decoration: BoxDecoration(
        color: Color.fromARGB(3, 0, 0, 0),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
        ),
        border:
            Border.all(color: Color.fromARGB(255, 225, 225, 225), width: 1.0),
      ),
      child: Column(

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
        border:
            Border.all(color: Color.fromARGB(255, 225, 225, 225), width: 1.0),
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
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.number, // Sadece sayısal klavye
                cursorWidth: 1,
                //controller: _nameController,
                decoration: InputDecoration(
                    labelText: 'Price',
                    border: OutlineInputBorder(),
                    hintText:
                        'Enter the amount to besss calculated.', // Placeholder metni
                    hintStyle:
                        TextStyle(color: Colors.grey, fontFamily: "Poppins")),
                cursorColor: Colors.amber,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter
                      .digitsOnly // Sadece sayıları kabul eder
                ],
              ),
            ]),
            SizedBox(height: 5),
            Text(
              textAlign: TextAlign.center,
              'Person Of People',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins', // veya kullandığınız fontun adı,
                  color: Colors.black),
            ),
            Center(
              child: CupertinoSpinBox(
                min: 1,
                max: 100,
                value: 2,
                onChanged: (value) => print(value),
                textStyle: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            SizedBox(height: 15),
            TextButton(
                style: TextButton.styleFrom(
                  elevation: 5.0,
                  backgroundColor: Colors.amber.shade400,
                  foregroundColor: Colors.black,
                  padding: EdgeInsets.all(15)
                ),
                onPressed: () => {},
                child: Column(
                  children: [
                    SizedBox(height: 5),
                    Text("Calculate",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
