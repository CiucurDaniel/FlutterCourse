import 'package:flutter/material.dart';
import 'package:http/http.dart';

class CountryFlagsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contries',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // a map would be better ?
  final List<String> flags = <String>[];
  final List<String> countryNames = <String>[];

  Future<void> _getDataFromWeb() async {
    print('REACHED FUNCTION');
    final Response response = await get(
        'https://www.worldometers.info/geography/flags-of-the-world/');

    final String data = response.body;

    final List<String> parts =
        data.split('<a href="/img/flags/').skip(1).toList();
    for (final String part in parts) {
      // name
      print(part.split('10px">')[1].split('<')[0]);
      countryNames.add(part.split('10px">')[1].split('<')[0]);

      final String file = part.substring(0, part.indexOf('"'));

      // image
      print('https://www.worldometers.info/img/flags/$file');
      flags.add('https://www.worldometers.info/img/flags/$file');
    }

    setState(() {
      // flags and countries list changed
    });
  }

  @override
  void initState() {
    super.initState();
    _getDataFromWeb();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flags from around the world'),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: List<Widget>.generate(flags.length, (int index) {
          return Card(
            color: Colors.blue,
            margin: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 3 / 2,
                      child: Image.network(
                        flags[index],
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Expanded(child: Center(child: Text('${countryNames[index]}')))
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
