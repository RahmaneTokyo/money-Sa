import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Home balance text
balanceText(text) {
  return Text(text, style: const TextStyle(fontSize: 30, color: Color.fromRGBO(143, 114, 241, 1)),);
}

// Home menu button
menuButton(title, icon) {
  return Column(
    children: [
      CircleAvatar(
        backgroundColor: Colors.transparent,
        child: IconButton(
          onPressed: () {},
          icon: Icon(icon, color: Color.fromRGBO(143, 114, 241, 1))
        ),
      ),
      const SizedBox(height: 5),
      Text(title),
      const SizedBox(height: 20),
    ],
  );
}

// User Infos
userInfos(name) {
  return ListTile(
    leading: const CircleAvatar(
      backgroundColor: Colors.white24,
      child: Icon(
        CupertinoIcons.person,
        color: Colors.white,
      ),
    ),
    title: Text(name, style: const TextStyle(color: Colors.white),),
  );
}

// Side Menu icon
menu(menu, icon) {
  return ListTile(
    onTap: () {
      if(menu == 'Deconnexion') {
        print("deconnexion");
      }
    },
    leading: Icon(
      icon,
    ),
    title: Text(menu),
  );
}

// Form validation
UnderlineInputBorder primaryInputBorder() {
  return UnderlineInputBorder(
      borderSide: const BorderSide(width: 2, color: Color.fromRGBO(143, 114, 241, 1)),
      borderRadius: BorderRadius.circular(10)
  );
}

UnderlineInputBorder errorInputBorder() {
  return UnderlineInputBorder(
    borderSide: const BorderSide(width: 2, color: Colors.red),
    borderRadius: BorderRadius.circular(10)
  );
}

inputStateColor(errorState) {
  return (errorState == true) ? Colors.red : const Color.fromRGBO(143, 114, 241, 1);
}

submitButton(size, loginKey, text) {
  return Container(
    width: size.width * 0.8,
    height: size.height * 0.08,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: const Color.fromRGBO(143, 114, 241, 1),
    ),
    child: TextButton(
      onPressed: () {
        if (loginKey.currentState!.validate()) {}
      },
      child: Text(text, style: const TextStyle(fontSize: 20, color: Colors.white)),
    ),
  );
}
// Form validation and components
