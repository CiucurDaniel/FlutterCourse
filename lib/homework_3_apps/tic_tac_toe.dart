import 'package:flutter/material.dart';

class TicTacToeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic tac toe',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

enum Player { X, O }
enum BoardTilesState { untapped, tappedByX, tappedByO }

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // O goes first
  Player _playerTurn = Player.O;

  // create a list to hold the tiles of the game
  final List<BoardTilesState> _gameBoard = <BoardTilesState>[
    BoardTilesState.untapped,
    BoardTilesState.untapped,
    BoardTilesState.untapped,
    BoardTilesState.untapped,
    BoardTilesState.untapped,
    BoardTilesState.untapped,
    BoardTilesState.untapped,
    BoardTilesState.untapped,
    BoardTilesState.untapped,
  ];

  // when a players taps a tile -> mark it as tapped by him and check if he won
  void _onPlayerTap(int indexWhereTapped) {
    setState(() {
      print('user tappped on tile $indexWhereTapped!');
      // update the gameBoard list
      if (_playerTurn == Player.O) {
        _gameBoard[indexWhereTapped] = BoardTilesState.tappedByO;
        _checkWin(Player.O);
        _playerTurn = Player.X;
      } else {
        _gameBoard[indexWhereTapped] = BoardTilesState.tappedByX;
        _checkWin(Player.X);
        _playerTurn = Player.O;
      }
    });
  }

  // check if a player won
  // check win and also check the the value of winning row is not Untapped
  void _checkWin(Player player) {
    // horizontal
    if ((_gameBoard[0] == _gameBoard[1]) &&
        (_gameBoard[2] == _gameBoard[1]) &&
        _gameBoard[0] != BoardTilesState.untapped) {
      _highlightWinningRow(0, 1, 2);
    }
    if ((_gameBoard[3] == _gameBoard[4]) &&
        (_gameBoard[5] == _gameBoard[4]) &&
        _gameBoard[3] != BoardTilesState.untapped) {
      _highlightWinningRow(3, 4, 5);
    }
    if ((_gameBoard[6] == _gameBoard[7]) &&
        (_gameBoard[8] == _gameBoard[7]) &&
        _gameBoard[6] != BoardTilesState.untapped) {
      _highlightWinningRow(6, 7, 8);
    }

    // vertical
    if ((_gameBoard[0] == _gameBoard[3]) &&
        (_gameBoard[6] == _gameBoard[3]) &&
        _gameBoard[0] != BoardTilesState.untapped) {
      _highlightWinningRow(0, 3, 6);
    }
    if ((_gameBoard[1] == _gameBoard[4]) &&
        (_gameBoard[7] == _gameBoard[4]) &&
        _gameBoard[1] != BoardTilesState.untapped) {
      _highlightWinningRow(1, 4, 7);
    }
    if ((_gameBoard[2] == _gameBoard[5]) &&
        (_gameBoard[8] == _gameBoard[5]) &&
        _gameBoard[2] != BoardTilesState.untapped) {
      _highlightWinningRow(2, 5, 8);
    }

    // diagonal
    if ((_gameBoard[0] == _gameBoard[4]) &&
        (_gameBoard[8] == _gameBoard[4]) &&
        _gameBoard[0] != BoardTilesState.untapped) {
      _highlightWinningRow(0, 4, 8);
    }
    if ((_gameBoard[2] == _gameBoard[4]) &&
        (_gameBoard[6] == _gameBoard[4]) &&
        _gameBoard[2] != BoardTilesState.untapped) {
      _highlightWinningRow(2, 4, 6);
    }
  }

  // helper function used to highlight the winning row
  void _highlightWinningRow(int rowIndex1, int rowIndex2, int rowIndex3) {
    setState(() {
      _resetGame();
      if (_playerTurn == Player.X) {
        _gameBoard[rowIndex1] = BoardTilesState.tappedByX;
        _gameBoard[rowIndex2] = BoardTilesState.tappedByX;
        _gameBoard[rowIndex3] = BoardTilesState.tappedByX;
      } else {
        _gameBoard[rowIndex1] = BoardTilesState.tappedByO;
        _gameBoard[rowIndex2] = BoardTilesState.tappedByO;
        _gameBoard[rowIndex3] = BoardTilesState.tappedByO;
      }
    });
  }

  // this function simply resets the gameBoard list when a game is over
  void _resetGame() {
    print('Reached resetGame');
    setState(() {
      for (int i = 0; i < _gameBoard.length; i++) {
        _gameBoard[i] = BoardTilesState.untapped;
      }
    });
  }

  // this function is used by build method to know what color a tile needs
  Color _getColorForGameTile(int index) {
    if (_gameBoard[index] == BoardTilesState.untapped) {
      return Colors.white;
    } else if (_gameBoard[index] == BoardTilesState.tappedByO) {
      // player O is Orange
      return Colors.deepOrange;
    } else {
      // player x is green
      return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('TicTacToe'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              children: List<Widget>.generate(9, (int index) {
                return InkWell(
                  child: Container(
                    child: Center(
                      child: Text('$index'),
                    ),
                    color: _getColorForGameTile(index),
                  ),
                  onTap: () => _onPlayerTap(index),
                );
              }),
            ),
          ),
          RaisedButton(
            onPressed: () => _resetGame(),
            child: const Text('Play Again'),
          ),
        ],
      ),
    );
  }
}
