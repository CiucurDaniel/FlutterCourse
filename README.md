[![Build status:](https://github.com/CiucurDaniel/FlutterCourse/workflows/UpCode/badge.svg)](https://github.com/CiucurDaniel/FlutterCourse/actions)
[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://github.com/CiucurDaniel/FlutterCourse/graphs/commit-activity)
[![Made with](https://img.shields.io/badge/Made%20with-Flutter-blue)](https://flutter.dev/)

## Flutter Course

This repository is used for Flutter Course from Google Programmers Hub. It will contain exercises from the course as well as homeworks. This serves as my first Flutter experience portofolio.

## Content

   * Course 1 - Introduction to Flutter
   * Course 2 - [Movie JSON Example](https://github.com/CiucurDaniel/FlutterCourse/blob/master/lib/Course2/movieJsonExample.dart)
   * Course 3 - : Layouts and media
   * Course 4 - [Country Flags app](https://github.com/CiucurDaniel/FlutterCourse/blob/master/lib/course4/country_flags.dart)
   * Course 5 - Redux state management
   * Course 6 - [Freezed](https://pub.dev/packages/freezed)
   * Course 7 - Epics and TypedReducers
  
  ### **Course 1**
  
  Course 1 was simply an `introduction to Flutter` with some quick code demos and a presentations of the advantages and features of Flutter.
  
  ### **Course 2**
  
  During Course 2 we learned how to make a `HTTP GET Request` with Flutter
and later on also how to make a `Model class`

We made a request from yts.mx which does not require an api key

To run this you need to create a "Run/Debug configuration in IntelliJ IDEA
with Dart console application and select this file which as you can see has the main method

  ### **Course 3**
  
  Layouts and media, simple animations and an introduction to [pub.dev](https://pub.dev/)
  ### **Course 4**
  
  During course 4 we learned some methods for `String manipulation` in Dart. After that we used the aquired skill in order to scrap information fram an HTTP Request from [Worldometers website](https://www.worldometers.info) and create a GridView with countries flags and name. For this we had to take the body from the HTTP request and extract the information we needed.
  
  ### **Course 5**
  
  On course 5 we learned how to use `Redux` (introduction) for our app arhitecture in order to make them scalable and testable.
  
  ### **Course 6**
  
  During course 6 we learned how to use `Freezed package` in order to `generate code for immutable objects`. Go to [Freezed package](https://pub.dev/packages/freezed)

## Homeworks
  
   * Homework 1 - [Currency Converter](https://github.com/CiucurDaniel/FlutterCourse/blob/master/lib/Homework_1_CurrencyConverter/currency_converter.dart)
   * Homework 2 app 1 - [Guess my number app](https://github.com/CiucurDaniel/FlutterCourse/blob/master/lib/Homework_2_MoreApps/guess_my_number.dart)
   * Homework 2 app 2 - [Square triangular numbers](https://github.com/CiucurDaniel/FlutterCourse/blob/master/lib/Homework_2_MoreApps/square_triangular_numbers.dart)
   * Homework 3 app 1 - [Tic Tac Toe](https://github.com/CiucurDaniel/FlutterCourse/blob/master/lib/homework_3_apps/tic_tac_toe.dart)
   * Homework 3 app 1 - [Translate app](https://github.com/CiucurDaniel/FlutterCourse/blob/master/lib/homework_3_apps/translate_app.dart)
   * Homework 5 - [Movie Collection](https://github.com/CiucurDaniel/FlutterCourse/tree/master/lib/homework_5)
 
  
  #### Homework 1 - **Currency Converter**
  
  Description: The following is a simple Currency Converter that converts EUR (input) to RON (output)
  
   #### Homework 2 - **Guess my number app**
  <p>Description: The following is a simple Guess my number app that pick a random number and guides the user towards guessing it
  
   #### Homework 2 - **Square triangular numbers**
  Description: Square triangular numbers is an app checks if a number is square triangular or both
  
   #### Homework 3 - **Tic Tac Toe**
  <p>Description: Tic Tac Toe game implmented in Flutter using GridView and InkWell for detection taps on tiles.
  
  #### Homework 3 - **Translate app**
  Description: Translate app has a grid of buttons with phrases like "hello" "how are you" and when tapped an audio spelling the phrase will play. The audio was from the assets folder.
  
  #### Homework 5 - **Movie app**
  
  Description: Movie app has a screen with a list of movies fetched from yts.mx api. The user can tap on movie see the more details about it and he can sort the movies by rating, or sort them alphabetically.
  
  ## How to run
  
  To run the apps from **homeworks** you simply need to go to `lib/main.dart` and from there you can simply uncomment the app you want to run.
  
  ```dart
  /*
To run simply uncomment the desired app and it's import from above
 */
void main() {
    //runApp(MyApp());
    //runApp(CurrencyConverter());
    //runApp(MyGuessingApp());
    //runApp(MyNumberCheckingApp());
    //runApp(TicTacToeApp());
    //runApp(TranslateApp());
    //runApp(CountryFlagsApp());
    runApp(MovieApp());
}
  ```
  To run an app from the **courses** you simply go to that course folder and you will see that each one has it's on `main.dart` file which you need to run. For example:
  ```
  /lib/course5/main.dart
  ```
  
 ## TODO:
 * [ ] add screenshoots of app 
 * [ ] rename some folders such that all respect lowerCamelCase format
 * [ ] move all homework in a homeworks folder and all courses content in a folder
