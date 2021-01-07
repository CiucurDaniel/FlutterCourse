import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*

Homework 2 Google Programmers Hub - Flutter Course

Description: The following is a simple Guess my number app

 */

class MyGuessingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const String appName = 'Guess The Number';
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        primaryColor: Colors.lightBlue[900],
      ),
      home: MyHomePage(),
    );
  }
}

// Subclass StatefulWidget
// The framework calls createState() when it wants to build the widget.
// createState() returns an instance of _MyHomePageState

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// Subclass State
// this class stores the mutable data that can change over the lifetime of the widget.
// the class also defines a build() method

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController guessedNumberController = TextEditingController();
  static Random random = Random();
  int randomNumber = random.nextInt(101);
  String statusText = '';

  // this method checks is the player guessed correctly
  String evaluateGuess(int guess) {
    if (guess > randomNumber) {
      return 'You tried ' + guess.toString() + '\n Try lower';
    } else if (guess < randomNumber) {
      return 'You tried ' + guess.toString() + '\n Try higher';
    }
    return 'You tried ' + guess.toString() + '\n You guessed right.';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guessing game'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Text('Im thinking of a nummber between 1 and 100'),
            const Text("It's your turn to guess my number"),
            Text(
              statusText,
              style: const TextStyle(fontSize: 14),
            ),
            Card(
              color: Colors.white70,
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        const Text('Try a number!'),
                        TextField(
                          controller: guessedNumberController,
                          keyboardType: TextInputType.number,
                        ),
                        RaisedButton(
                            child: const Text('Guess'),
                            onPressed: () {
                              setState(() {
                                statusText = evaluateGuess(int.parse(guessedNumberController.text));
                              });
                            }),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    guessedNumberController.dispose();
  }
}
