
<h1>Flutter Course</h1>
<p>This repository is used for Flutter Course from Google Programmers Hub. It will contain exercises from the course as well as homeworks. This serves as my first Flutter experience portofolio.</p>

<h2>Content<h2>
  
  <ul>
   <li>Course 2 - <a href="https://github.com/CiucurDaniel/FlutterCourse/blob/master/lib/Course2/movieJsonExample.dart">Movie JSON Example</a></li>
   <li>Course 3 - ... </li>
   <li>Course 4 - <a href="https://github.com/CiucurDaniel/FlutterCourse/blob/master/lib/course4/country_flags.dart">Country Flags app</a></li>
   <li>Course 5 - Redux state management</li>
   <li>Course 6 - Freezed </li>
   <li>Course 7 - Epics and TypedReducers</li>
  </ul>
  
  <h4>Course 1</h4>
  <p>Course 1 was simply an introduction to Flutter with some quick code demos and a presentations of the advantages and features of Flutter.</p>
  
  <h4>Course 2</h4>
  <p>During Course 2 we learned how to make a `HTTP GET Request` with Flutter
and later on also how to make a Model class

We made a request from yts.mx which does not require an api key

To run this you need to create a "Run/Debug configuration in IntelliJ IDEA
with Dart console application and select this file which as you can see has the main method</p>
  <h4>Course 4</h4>
  <p>During course 4 we learned some methods for String manipulation in Dart. After that we used the aquired skill in order to scrap information fram an HTTP Request from <a href="https://www.worldometers.info">Worldometers website</a> and create a GridView with countries flags and name. For this we had to take the body from the HTTP request and extract the information we needed</p>
  
  <h4>Course 6</h4>
  <p>During course 6 we learned how to use `Freezed package` in order to `generate code for immutable objects`. Go to <a href="https://pub.dev/packages/freezed">Freezed package</a></p>

<h2>Homeworks<h2>
  
  <ul>
  <li>Homework 1 - <a href="https://github.com/CiucurDaniel/FlutterCourse/blob/master/lib/Homework_1_CurrencyConverter/currency_converter.dart">Currency Converter</a></li>
   <li>Homework 2 app 1 - <a href="https://github.com/CiucurDaniel/FlutterCourse/blob/master/lib/Homework_2_MoreApps/guess_my_number.dart">Guess my number app</a></li>
  <li>Homework 2 app 2 - <a href="https://github.com/CiucurDaniel/FlutterCourse/blob/master/lib/Homework_2_MoreApps/square_triangular_numbers.dart">Square triangular numbers</a></li>
   <li>Homework 3 app 1 - <a href="https://github.com/CiucurDaniel/FlutterCourse/blob/master/lib/homework_3_apps/tic_tac_toe.dart">Tic Tac Toe</a></li>
  <li>Homework 3 app 1 - <a href="https://github.com/CiucurDaniel/FlutterCourse/blob/master/lib/homework_3_apps/translate_app.dart">Translate app</a></li>
   <li>Homework 5 - <a href="https://github.com/CiucurDaniel/FlutterCourse/tree/master/lib/homework_5"> Movie Collection</a></li>
  </ul>
  
  <h4>Homework 1 - Currency Converter</h4>
  <p>Description: The following is a simple Currency Converter that converts EUR (input) to RON (output)</p>
  
   <h4>Homework 2 - Guess my number app</h4>
  <p>Description: The following is a simple Guess my number app that pick a random number and guides the user towards guessing it</p>
  
   <h4>Homework 2 - Square triangular numbers</h4>
  <p>Description: Square triangular numbers is an app checks if a number is square triangular or both</p>
  
   <h4>Homework 3 - Tic Tac Toe</h4>
  <p>Description: Tic Tac Toe game implmented in Flutter using GridView and InkWell for detection taps on tiles.</p>
  
  <h4>Homework 3 - Translate app</h4>
  <p>Description: Translate app has a grid of buttons with phrases like "hello" "how are you" and when tapped an audio spelling the phrase will play. The audio was from the assets folder.</p>

## Redux Flutter
## Key Concepts

  * App `State` is an immutable Object that lives at the top of your Widget hierarchy within a `Store`.
  * The `Store` is passed down to all ancestors via an `InheritedWidget` called a `StoreProvider`
  * The `State` object is immutable. To create a new `State`, you must dispatch an `Action`.
  * The `Action` will be picked up by a `Reducer`, which is a function that builds and returns a new `State` based on the previous `State` and the `Action` that was dispatched.
  * Reducers are pure functions.
  * When there is a new app State, all Widgets connected to the `Store` using `StoreConnector` will be rebuilt.
  * The Widgets that use `StoreConnectors` are called `container` Widgets. They are only responsible for converting the latest App State to a `ViewModel`.
  * The Widgets that display data are called `presentation` widgets. Think of a `Text` widget or `FloatingActionButton`.
  * To read data from the `State`, use `selector` functions. These act like queries against your "State Database".
  * To handle fetching data from our Database or Web Service, we use a `Middleware`.
  
## App State Singleton

In Redux, the idea is to store your Application State in a root level singleton.

If you read through the Vanilla example, you'll see this takes advantage of a core principle: Lifting State up. In this case, we're Lifting our App State all the way to the top of our App so that all descendants have access to it.

To accomplish this, you create a Redux `Store` and hand it to a `StoreProvider`. All descendants of the `StoreProvider` can access the store using a `StoreProvider.of(context).store` or by using ` StoreConnector` Widget.

## Updating App State

In order to update the App State in a Redux app, you must dispatch an `Action`.

This `Action` will then be intercepted by your `Reducer` function, which is responsible for updating the App State using the data contained within the `Action`.

`Reducer` functions are pure functions. They are only responsible for taking in the last state and the dispatched action, and returning a new App State.

This means `Reducer` functions should not make any API calls or have side effects such as logging. For this purpose, use `Middleware`. 

While this may feel like "Boilerplate" when you first start using Redux, the motivation is thus (from the [original Redux Docs](http://redux.js.org/)):

  > If a model can update another model, then a view can update a model, which updates another model, and this, in turn, might cause another view to update. At some point, you no longer understand what happens in your app as you have lost control over the when, why, and how of its state. When a system is opaque and non-deterministic, it's hard to reproduce bugs or add new features.  

If you've felt this pain in your app, it might be a good time to consider Redux or another State management pattern.

Dispatching `Actions` and updating the App State in this rigorous way allows you to easily determine: 

  1. What Action caused a State change
  2. What Reducer is responsible for handling that change
  3. Why the State was broken in response to an Action.
  4. When a View needs to update in response to a State change
  
## Updating UI

Whenever your App State changes, as a result of an `Action` for example, you most likely want to update your UI in some way.

To do so, connect to the `StoreProvider` using a `StoreConnector` Widget. The job of the `StoreConnector` widget is simple: Take the latest state of the store and convert it into a `ViewModel`. Then, build a Widget tree using this `ViewModel`.

Whenever the App State changes, the `StoreConnector` will rebuild the `ViewModel` and `Widget` tree.

In order to make it easier to test your Widgets and share functionality, it is recommended you have two types of Widgets:

  * `container` Widgets -- These use `StoreConnector` Widgets to build up a `ViewModel` for your `presentation` Widgets.
  * `presentation` Widgets -- `StatelessWidget`s that are given all the data they need and are responsible for building the UI.
  
This allows you to more easily test your `presentation` Widgets, because you only need to pass in the data they require in each test for rendering, and then write assertions against the rendered output. Think of them as the "pure functions" of our UI.

It also allows you to reuse `container` Widgets. For an example, please look at the `AppLoading` Widget.

## Selector Functions

`Selector` functions are simple functions that provide a single point of access to your App State. For a full explanation of why they are useful, please refer to the [reselect](https://pub.dartlang.org/packages/reselect) package.

## Fetching and Storing Data using Middleware

In order to fetch our Todos from the Web or a Database, we need to make an async call. Since `Reducer` functions are pure, we must instead use a `Middleware`.

`Middleware` are run in response to `Actions` that are dispatched, and execute before the `Reducer`. This allows you to intercept an `Action` and fetch data in response!

In this app, we have a "Store Todos Middleware". It responds to `LoadTodos` and `SaveTodos` type of actions by either fetching the todos or persisting them to a Database or Web Service.   

## Testing

Generally, this app conforms the "Testing Pyramid": Lots of Unit tests, fewer Widget tests, and fewer integration tests.

  * Unit tests
    - `Reducer` functions are very easy to unit test since they are pure functions
    - `Middleware` functions that call out to APIs can be tested using Mock implementations. This is done using the Mockito library.
    - `selector` functions are also easy to test since they are pure.
  * Widget Tests
    - `container` Widgets can be tested to ensure they generate the correct `ViewModel`.
    - `presentation` Widgets can be tested by passing in fake data and making assertions against the Widget rendered with that data.
  * Integration Tests
    - Run the app and drive it using flutter_driver `flutter drive --target test_driver/todo_app.dart`.
    - Use the "Page Object Model" pattern to make the tests easier to read and maintain.

## Getting Started

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
