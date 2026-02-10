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
  
  void _onTap(int index) {
    setState(() {
      if (onturn && X_O_display[index] == '') {
        X_O_display[index] = "O";
        onturn = false;
      } else if (!onturn && X_O_display[index] == '') {
        X_O_display[index] = "X";
        onturn = true;
      }

      _checkWinner();
    });
  }

  void _checkWinner() {
    //Row wise win
    if (X_O_display[0] == X_O_display[1] &&
        X_O_display[1] == X_O_display[2] &&
        X_O_display[0] != "") {
      _showWinMsg();
    }
    if (X_O_display[3] == X_O_display[4] &&
        X_O_display[4] == X_O_display[5] &&
        X_O_display[3] != "") {
      _showWinMsg();
    }
    if (X_O_display[6] == X_O_display[7] &&
        X_O_display[7] == X_O_display[8] &&
        X_O_display[6] != "") {
      _showWinMsg();
    }
    //Column wise check
    if (X_O_display[0] == X_O_display[3] &&
        X_O_display[3] == X_O_display[6] &&
        X_O_display[0] != "") {
      _showWinMsg();
    }
    if (X_O_display[1] == X_O_display[4] &&
        X_O_display[4] == X_O_display[7] &&
        X_O_display[1] != "") {
      _showWinMsg();
    }
    if (X_O_display[2] == X_O_display[5] &&
        X_O_display[5] == X_O_display[8] &&
        X_O_display[2] != "") {
      _showWinMsg();
    }

    //Diagnols
    if (X_O_display[0] == X_O_display[4] &&
        X_O_display[4] == X_O_display[8] &&
        X_O_display[0] != "") {
      _showWinMsg();
    }
    if (X_O_display[2] == X_O_display[4] &&
        X_O_display[4] == X_O_display[6] &&
        X_O_display[2] != "") {
      _showWinMsg();
    }
  }

  void _showWinMsg() {
     if(onturn){
          setState((){
            Xscore = Xscore+1;
          });
        }else if(!onturn){
          setState((){
            Oscore=Oscore+1;
          });
        
        }
    showDialog(
      context: context,
      builder: (BuildContext context) {
       
        return AlertDialog(
          title: Text(onturn ? "Player 2 wins" : "Player 1 wins"),
        );
      },
    );
  }

 final  _myTextStuyles = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w900,
  );



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text('Player 01: O:', style: _myTextStuyles),
                      Text('$Oscore', style: _myTextStuyles),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Player 01: O:', style: _myTextStuyles),
                      Text('$Xscore', style: _myTextStuyles),
                    ],
                  ),
                ],
              ),
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
                  onTap: () {
                    _onTap(index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromARGB(255, 48, 13, 87),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        // index.toString(),
                        X_O_display[index],
                        style: TextStyle(color: Colors.white, fontSize: 40),
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
