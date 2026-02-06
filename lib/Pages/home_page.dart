
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget{
  @override
  _HomePageState createState()=>_HomePageState();    
  }


class _HomePageState extends State<HomePage>{

  List <String> X_O_display=[ 
                              "","","",
                              "","","",
                              "","",""
                            ];

  void _onTap(int index){
    setState((){
      X_O_display[index]="O";
    });
  }

  @override
  Widget  build(BuildContext context){
    return Scaffold(
    backgroundColor:Colors.grey[600],
    body:GridView.builder(
    itemCount:9,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:3), 
    itemBuilder: (BuildContext context , int index){
      return GestureDetector(
        onTap:(){
          _onTap(index);
        },
        child: Container(
          decoration:BoxDecoration(
            border:Border.all(color:Color.fromARGB(255, 48, 13, 87)),
          ),
          child:Center(
            child:Text(
             // index.toString(),
             X_O_display[index],
              style:TextStyle(
                color:Colors.white,
                fontSize:40,
              )),
          ),
        ),
      );
    })
    );
  }
}