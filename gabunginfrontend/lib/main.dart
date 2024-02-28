import 'package:flutter/material.dart';
import 'package:gabunginfrontend/pages/intro_screen.dart';
import 'package:gabunginfrontend/pages/tapBar_search.dart';
// import 'package:nutrizoom_apps/pages/tapBar_search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            textTheme: const TextTheme(
          //judul page
          headline1: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 23,
              color: Colors.white,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold),

          //judul content
          headline2: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 18,
              color: Colors.black,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600),

          //profile title
          headline3: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 20,
              color: Colors.white,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600,
              letterSpacing: 2.5,
              shadows: [
                Shadow(
                    blurRadius: 10.0,
                    color: Colors.black,
                    offset: Offset(2.0, 2.0))
              ]),

          //judul resep slider
          headline4: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 16,
            color: Color(0xff3C6142),
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            shadows: <Shadow>[
              Shadow(
                offset: Offset(2.0, 2.0),
                blurRadius: 3.0,
                color: Colors.grey,
              ),
            ],
          ),

          //headline judul content biar beda
          headline5: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 16,
              color: Colors.black,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600),

          //Khusus informasi gizi
          headline6: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 20,
              color: Colors.black,
              letterSpacing: 2.5,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w700),

          //profile sub title (email)
          subtitle1: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 14,
              color: Colors.white,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              shadows: [
                Shadow(
                    blurRadius: 10.0,
                    color: Colors.black,
                    offset: Offset(5.0, 2.0))
              ]),

          //body
          bodyText1: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 15,
              color: Colors.black,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400),

          //button
          button: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 20,
              color: Colors.white,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500),

          //info resep
          bodyText2: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 12,
              color: Colors.black54,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500),

          // versi bold bodytext1
          subtitle2: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 15,
              color: Colors.black,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold),

        )),
        home: IntroScreen());
  }
}
