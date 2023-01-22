import 'package:flutter/material.dart';
import 'package:moneysa/Functions/functions.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  bool balanceVisible = false;
  bool balanceValue = true;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          constraints: BoxConstraints(
            minWidth: screenWidth * 1,
            minHeight: screenHeight * 0.2
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(143, 114, 241, 1),
                blurRadius: 3,
                offset: Offset(4, 4,), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: Text(
                  'Solde Actuel',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (balanceValue == true)...[
                      balanceText('XOF 960,000')
                    ]else...[
                      balanceText('******')
                    ],
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          balanceValue = !balanceValue;
                          balanceVisible = !balanceVisible;
                        });
                      },
                      child: Icon((balanceVisible == false) ? Icons.visibility_off : Icons.visibility, size: 30, color: const Color.fromRGBO(143, 114, 241, 1),),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    menuButton('Dépot', Icons.arrow_forward_outlined),
                    menuButton('Retrait', Icons.arrow_back_outlined),
                    menuButton('Trades', Icons.compare_arrows_outlined),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
