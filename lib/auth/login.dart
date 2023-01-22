import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moneysa/Functions/functions.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  final _loginKey = GlobalKey<FormState>();
  final FocusNode stateFocus = FocusNode();
  bool _errorState = false;
  RegExp regex = RegExp(r'(^(?:70|75|76|77|78|)?[0-9]{7}$)');

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Flexible(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/money.png"),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      'Votre portefeuille rapide et fiable',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              )
            ),
          ),
          Form(
            key: _loginKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 50),
                  child: Center(
                    child: TextFormField(
                      focusNode: stateFocus,
                      decoration: InputDecoration(
                        enabledBorder: primaryInputBorder(),
                        focusedBorder: primaryInputBorder(),
                        errorBorder: errorInputBorder(),
                        suffixIcon: Icon(Icons.phone, color: inputStateColor(_errorState)),
                        labelText: 'Téléphone',
                        hintText: 'ex: 7777777',
                        labelStyle: TextStyle(color: inputStateColor(_errorState))
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly], // Only numbers can be entered
                      // Phone validation
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          setState(() {
                            _errorState = true;
                          });
                          return 'Entrer votre numéro de téléphone';
                        }else {
                          if (!regex.hasMatch(value)) {
                            setState(() {
                            _errorState = true;
                          });
                            return 'Numéro de téléphone invalide';
                          } else {
                            setState(() {
                              _errorState = false;
                            });
                            return null;
                          }
                        }
                      },
                    ),
                  ),
                ),
                Container(
                  width: size.width * 0.8,
                  height: size.height * 0.08,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromRGBO(143, 114, 241, 1),
                  ),
                  child: TextButton(
                    onPressed: () {
                      if (_loginKey.currentState!.validate()) {}
                    },
                    child: const Text('Suivant', style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}