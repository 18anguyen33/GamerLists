import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'forgotpassword.dart';
import 'startquestionaire.dart';
import 'personalinfo.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<SettingsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top:20, bottom: 10, right: 5, left: 5),
              child: Text(
                "Account Page",
                textAlign: TextAlign.center,
                style: GoogleFonts.notoSerif(
                  fontWeight: FontWeight.w700,
                  fontSize: 40,
                  fontStyle: FontStyle.normal,
                  color: Colors.blue[700],
                ),
              )
          ),
          Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10,left: 10, right:10),
                  width: 400,
                  child: OutlinedButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ForgotPasswordPage(title: '')),
                      );
                    },
                    child: Text(
                      'Change Password',
                      textAlign: TextAlign.center,
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
                  width: 400,
                  child: OutlinedButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => QuestionPage(title: 'Questionnaire')),
                      );
                    },
                    child: Text(
                      'Retake User Questionnaire',
                      textAlign: TextAlign.center,
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
              ]
          ),
            ]
        ),
        ),
      );// This trailing comma makes auto-formatting nicer for build methods.
  }
}
