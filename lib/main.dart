import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/Pages/home_page.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

static final TextStyle myNewFont = GoogleFonts.pressStart2p(
  textStyle: const TextStyle(
    color: Colors.black,
    letterSpacing: 3,
  ),
);
static final TextStyle myNewWhiteFont = GoogleFonts.pressStart2p(
  textStyle: const TextStyle(
    color: Colors.white,
    letterSpacing: 3,
    fontSize:15
  ),
);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner:false,
        home:HomePage(),
    );
  }
}
