import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login.dart';
import 'main.dart';
import 'startquestionaire.dart';

class ResetPage extends StatefulWidget {
  ResetPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ResetState createState() => _ResetState();
}

class _ResetState extends State<ResetPage> {
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
                  'Password Reset',
                style: GoogleFonts.notoSerif(
                  fontWeight: FontWeight.w700,
                  fontSize: 40,
                  fontStyle: FontStyle.normal,
                  color: Colors.blue[700],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                  'A password reset email has been sent to the email provided. Please check your email to reset your password',
                style: GoogleFonts.notoSerif(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  fontStyle: FontStyle.normal,
                ),
                  textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right:10),
              width:380,
              child: OutlineButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage(title: '')),
                  );
                },
                child: Text(
                  'Back to Home Page',
                  style: GoogleFonts.notoSerif(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
