import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:moneysa/layouts/calculator/calculator.dart';
import 'package:moneysa/layouts/home/mainHome.dart';
import 'package:moneysa/layouts/sideMenu/side_menu.dart';
import 'package:moneysa/layouts/trades/trades.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    MainHomePage(),
    TradePage(),
    Calculator()
  ];

  void onTappedIndex(int index) {
    setState(() {
      _currentIndex = index;
      print(_currentIndex);
    });
  }

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: scaffoldKey,
      drawer: const NavBar(),
      appBar: AppBar(
        // AppBar height
        toolbarHeight: 100,
        // Appbar shadow
        elevation: 0,
        // Appbar background
        backgroundColor: _currentIndex == 2 ? Colors.white : Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GestureDetector(
            onTap: () {
              scaffoldKey.currentState?.openDrawer();
            },
            child: const Icon(Icons.menu, size: 35, color: Color.fromRGBO(143, 114, 241, 1),),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Avatar
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.transparent,
              child: Image.asset("assets/images/money-logo.png"),
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
      body: _children[_currentIndex],
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: GNav(
            onTabChange: onTappedIndex,
            selectedIndex: _currentIndex,
            activeColor: Colors.white,
            tabBackgroundColor: const Color.fromRGBO(143, 114, 241, 1),
            gap: 5,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Accueil',
              ),
              GButton(
                icon: Icons.compare_arrows_sharp,
                text: 'Transactions',
              ),
              GButton(
                icon: Icons.calculate,
                text: 'Calculateur de frais',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
