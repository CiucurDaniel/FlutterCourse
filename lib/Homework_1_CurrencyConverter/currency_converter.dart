import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*

Homework 1 Google Programmers Hub - Flutter Course

Description: The following is a simple Currency Converter that converts EUR (input) to RON (output)

 */
class CurrencyConverter extends StatefulWidget {
  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
    //return Container();
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double amount = 0; // the amount the user want to convert
  String convertedAmount = ''; // the amount value after the conversion

  final TextEditingController myController =
      TextEditingController(); // use it to retrieve the current value of the TextField.

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(children: <Widget>[
          Image.network('https://picsum.photos/250?image=9'),
          const SizedBox(height: 20),
          TextField(
            controller: myController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(hintText: 'Enter the ammount of money'),
          ),
          const SizedBox(height: 20),
          RaisedButton(
              child: const Text('Convert'),
              onPressed: () {
                exchangeEurToRon(double.parse(myController.text));
                print('Button pressed');
                if (exchangeEurToRon(double.parse(myController.text)) != null) {
                  print('result is ' + exchangeEurToRon(double.parse(myController.text)));
                }
              }),
          const SizedBox(height: 20),
          Text(
            '$convertedAmount LEI',
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 42),
          )
        ]),
      ),
    );
  }

  // method used to convert the input (LEI currency) to EURO
  String exchangeEurToRon(double amount) {
    setState(() {
      final double calculation = amount / 4.75;
      convertedAmount = calculation.toStringAsFixed(3);

      print(convertedAmount);
    });
    return convertedAmount;
  }
}
