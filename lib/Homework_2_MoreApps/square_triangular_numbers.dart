import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*

Homework 2 Google Programmers Hub - Flutter Course

Description: The following is a simple app where the user
will give a number and the app will tell if the number is square triangular or both.


 */
class MyNumberCheckingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My number app',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController myController =
      TextEditingController(); // use it to retrieve the current value of the TextField.

  /// This will simply represent the number the user has chosen.
  String dialogTitleText = '';

  /// This will be the result of the evaluation function.
  String dialogContentText = '';

  String _evaluateInputNumber(int number) {
    final int n = pow(number, 1 / 3).round().toInt();
    final int j = sqrt(number).toInt();
    if (n * n * n == number && j * j == number) {
      return 'Number $number is both SQUARE and TRIANGULAR.';
    } else if (n * n * n == number) {
      return 'Number $number is TRIANGULAR.';
    } else if (j * j == number) {
      return 'Number $number is SQUARE.';
    }
    return 'Number $number is neither SQUARE and TRIANGULAR.';
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must not tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(dialogTitleText),
          content: Text(dialogContentText),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Number shapes'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          setState(() {
            dialogTitleText = myController.text; // set the number as the title
            dialogContentText = _evaluateInputNumber(int.parse(
                myController.text)); //convert input to type int and evaluate it
            _showMyDialog();
          });
        },
        child: const Icon(Icons.play_arrow),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(children: <Widget>[
          const SizedBox(height: 20),
          TextField(
            controller: myController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(hintText: 'Enter your number'),
          ),
          const SizedBox(height: 20),
        ]),
      ),
    );
  }
}
