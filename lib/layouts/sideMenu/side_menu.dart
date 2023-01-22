import 'package:flutter/material.dart';
import 'package:moneysa/Functions/functions.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.transparent
            ),
            accountName: Text('Rahmane Ndiaye', style: TextStyle(color: Colors.black),),
            accountEmail: Text(''),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.black12,
              radius: 30,
              child: Icon(Icons.person_outline, size: 40, color: Colors.white,),
            ),
          ),
          menu('Home', Icons.home),
          const Divider(height: 1),
          menu('Profile', Icons.person),
          const Divider(height: 1),
          menu('Deconnexion', Icons.exit_to_app),
        ],
      ),
    );
  }
}

