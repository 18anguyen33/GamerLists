import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gamer_lists/reset.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login.dart';
import 'main.dart';
import 'startquestionaire.dart';

class ForgotPasswordPage extends StatefulWidget {
  ForgotPasswordPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPasswordPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                  'Forgot Password',
                textAlign: TextAlign.center,
                style: GoogleFonts.notoSerif(
                  fontWeight: FontWeight.w700,
                  fontSize: 40,
                  fontStyle: FontStyle.normal,
                  color: Colors.blue[700],
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 10, right:10),
                height:35,
                child: TextField(
                  controller: emailController,
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),style: GoogleFonts.notoSerif(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  fontStyle: FontStyle.normal,
                ),
                )
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right:10),
              width:380,
              child: OutlinedButton(
                onPressed: (){
                  FirebaseAuth.instance.sendPasswordResetEmail(email:emailController.text).then((value){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ResetPage(title: '')),
                    );
                  }).catchError((error) {
                    print("Password Reset Failed");
                    print(error.toString());
                  });
                },
                child: Text(
                  'Submit Email',
                  style: GoogleFonts.notoSerif(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                  style: OutlinedButton.styleFrom(
                    primary: Colors.blueGrey[800],
                    side: BorderSide(
                      color: Colors.blueGrey,
                    ),
                    padding: EdgeInsets.all(5),
                  )
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right:10),
              width:380,
              child: OutlinedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage(title: '')),
                  );
                },
                child: Text(
                  'Back',
                  style: GoogleFonts.notoSerif(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                  style: OutlinedButton.styleFrom(
                    primary: Colors.blueGrey[800],
                    side: BorderSide(
                      color: Colors.blueGrey,
                    ),
                    padding: EdgeInsets.all(5),
                  )
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
