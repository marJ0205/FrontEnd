import 'package:flutter/material.dart';
import 'package:gabunginfrontend/pages/change_password.dart';
import 'package:gabunginfrontend/pages/change_profile.dart';
import 'package:gabunginfrontend/pages/recipe_details.dart';
import 'package:gabunginfrontend/pages/tapBar_search.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;
  List<Widget> body = [
    TapBar(),
    DetailsRec(),
    change_password(),
    change_profile()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: body[_currentIndex],

      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int newIndex) {
          setState((){
            _currentIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: "Beranda",
            icon: Icon(Icons.home_outlined, color: Color(0xff3C6142),)
          ),
          BottomNavigationBarItem(
            label: "BMI",
            icon: Icon(Icons.monitor_weight_outlined, color: Color(0xff3C6142),)
          ),
          BottomNavigationBarItem(
            label: "Artikel",
            icon: Icon(Icons.article_outlined, color: Color(0xff3C6142))
          ),
          BottomNavigationBarItem(
            label: "Profil",
            icon: Icon(Icons.person_2_outlined, color: Color(0xff3C6142))
          ),
        ],
      ),
    );
  }
}