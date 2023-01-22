import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class Otp extends StatefulWidget {
  const Otp({Key? key}) : super(key: key);

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_outlined, color: Color.fromRGBO(143, 114, 241, 1), size: 40,)
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Image.asset("assets/images/money.png", width: 300),
            ),
            Text('Verification', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Text('Veuillez entrer votre code secret', style: TextStyle(color: Colors.black54),),
            SizedBox(height: 20,),
            OtpTextField(
              numberOfFields: 5,
              borderColor: Color.fromRGBO(143, 114, 241, 1),
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode){
                showDialog(
                  context: context,
                  builder: (context){
                    return AlertDialog(
                      title: Text("Verification Code"),
                      content: Text('Code entered $verificationCode successful'),
                    );
                  }
                );
              }, // end onSubmit
            ),
          ],
        ),
      ),
    );
  }
}
