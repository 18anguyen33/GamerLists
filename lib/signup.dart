import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

import 'main.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUpPage> {
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
                  'Create a New Account',
                style: GoogleFonts.notoSerif(
                fontWeight: FontWeight.w700,
                fontSize: 30,
                fontStyle: FontStyle.normal,
                  color: Colors.blue[700],
              ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 10, right:10, top:5),
                height:35,
                child: TextField(
                  controller: emailController,
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                  style: GoogleFonts.notoSerif(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    fontStyle: FontStyle.normal,
                  ),
                )
            ),
            Container(
                margin: EdgeInsets.only(left: 10, right:10, top:5),
                height:35,
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                  style: GoogleFonts.notoSerif(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    fontStyle: FontStyle.normal,
                  ),
                )
            ),
            Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    width:374,
                    child: OutlinedButton(
                      onPressed: () async {
                        print(emailController.text);
                        await FirebaseAuth.instance.createUserWithEmailAndPassword(
                            email: emailController.text, password: passwordController.text)
                            .then((value) {
                                print("Sign Up Successful");
                                Navigator.pop(context);
                            }).catchError((error) {
                                print("Sign up Failed");
                                print(error.toString());
                            });
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => QuestionPage(title: 'Questionnaire')),
                        // );
                      },
                      child: Text(
                        'Sign Up',
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
            Container(
              margin: EdgeInsets.only(left: 10, right:10),
              width:380,
              child: OutlinedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage(title: '')),
                  );
                },
                child: Text(
                  'Back',
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
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
