import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool onturn = true;

  List<String> X_O_display = ["", "", "", "", "", "", "", "", ""];

  int Xscore = 0;
  int Oscore = 0;
  int filledBoxes = 0;

  void _onTap(int index) {
    if (X_O_display[index] != "") return;

    setState(() {
      if (onturn) {
        X_O_display[index] = "O";
      } else {
        X_O_display[index] = "X";
      }

      filledBoxes += 1;
      onturn = !onturn;
    });

    _checkWinner();
  }

 void _checkWinner() {
  String winner = "";

  // Rows
  if (X_O_display[0] == X_O_display[1] &&
      X_O_display[1] == X_O_display[2] &&
      X_O_display[0] != "") {
    winner = X_O_display[0];
  } 
  else if (X_O_display[3] == X_O_display[4] &&
      X_O_display[4] == X_O_display[5] &&
      X_O_display[3] != "") {
    winner = X_O_display[3];
  } 
  else if (X_O_display[6] == X_O_display[7] &&
      X_O_display[7] == X_O_display[8] &&
      X_O_display[6] != "") {
    winner = X_O_display[6];
  }

  // Columns
  else if (X_O_display[0] == X_O_display[3] &&
      X_O_display[3] == X_O_display[6] &&
      X_O_display[0] != "") {
    winner = X_O_display[0];
  } 
  else if (X_O_display[1] == X_O_display[4] &&
      X_O_display[4] == X_O_display[7] &&
      X_O_display[1] != "") {
    winner = X_O_display[1];
  } 
  else if (X_O_display[2] == X_O_display[5] &&
      X_O_display[5] == X_O_display[8] &&
      X_O_display[2] != "") {
    winner = X_O_display[2];
  }

  // Diagonals
  else if (X_O_display[0] == X_O_display[4] &&
      X_O_display[4] == X_O_display[8] &&
      X_O_display[0] != "") {
    winner = X_O_display[0];
  } 
  else if (X_O_display[2] == X_O_display[4] &&
      X_O_display[4] == X_O_display[6] &&
      X_O_display[2] != "") {
    winner = X_O_display[2];
  }

  // If winner found
  if (winner != "") {
    _showWinMsg(winner);
    return;
  }

  // If no winner and board full → Draw
  if (filledBoxes == 9) {
    _showDrawmsg();
  }
}


  void _showWinMsg(String winner) {
    setState(() {
      if (winner == "O") {
        Oscore++;
      } else {
        Xscore++;
      }
    });

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Player ${winner == "O" ? "01 (O)" : "02 (X)"} Wins"),
          actions: [
            TextButton(
              child: Text("Reset"),
              onPressed: () {
                _clearBoard();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showDrawmsg() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("It's a Draw"),
          actions: [
            TextButton(
              child: Text("Reset"),
              onPressed: () {
                _clearBoard();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        X_O_display[i] = '';
      }
      filledBoxes = 0;
      onturn = true;
    });
  }

  final _myTextStuyles = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w900,
    fontSize: 18,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Player 01: O', style: _myTextStuyles),
                      Text('$Oscore', style: _myTextStuyles),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Player 02: X', style: _myTextStuyles),
                      Text('$Xscore', style: _myTextStuyles),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.builder(
              itemCount: 9,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => _onTap(index),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromARGB(255, 48, 13, 87),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        X_O_display[index],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(child: Container(color: Colors.red)),
        ],
      ),
    );
  }
}
