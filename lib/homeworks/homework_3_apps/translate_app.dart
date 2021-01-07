import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class TranslateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Translate app',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AudioCache _audioCache;

  final List<String> phrases = <String>[
    'salut',
    'salut (Germana)',
    'ma numesc',
    'ma numesc (Germana)',
    'cum esti?',
    'cum esti? (Germana)',
    'sunt bine',
    'sunt bine (Germana)'
  ];

  @override
  void initState() {
    super.initState();
    // create this only once
    _audioCache = AudioCache(prefix: 'assets/audio/', fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Translate'),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List<Widget>.generate(8, (int index) {
          return GestureDetector(
            onTap: () => playPhraseAudio(index),
            child: Container(
              child: Card(
                color: Colors.blue,
                margin: const EdgeInsets.all(32),
                child: Center(
                  child: FittedBox(
                    child: Text(phrases[index]),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  void playPhraseAudio(int index) {
    setState(() {
      print('I got tapped with index: $index');
      switch (index) {
        case 0:
          {
            _audioCache.play('0_salut_romana.mp3');
          }
          break;
        case 1:
          {
            _audioCache.play('1_salut_germana.mp3');
          }
          break;
        case 2:
          {
            _audioCache.play('2_maNumesc_romana.mp3');
          }
          break;
        case 3:
          {
            _audioCache.play('3_maNumesc_germana.mp3');
          }
          break;
        case 4:
          {
            _audioCache.play('4_cumEsti_romana.mp3');
          }
          break;
        case 5:
          {
            _audioCache.play('4_cumEsti_germana.mp3');
          }
          break;
        case 6:
          {
            _audioCache.play('6_suntBine_romana.mp3');
          }
          break;
        case 7:
          {
            _audioCache.play('7_suntBine_germana.mp3');
          }
          break;
      }
    });
  }
}
