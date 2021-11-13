import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'forgotpassword.dart';
import 'main.dart';
import 'startquestionaire.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
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
                  'Login to Your Account',
                style: GoogleFonts.notoSerif(
                fontWeight: FontWeight.w700,
                fontSize: 30,
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
                  obscureText: false,
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
                margin: EdgeInsets.only(left: 10, right:10),
                width:150,
                child: OutlinedButton(
                  onPressed: () async{
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: emailController.text, password: passwordController.text)
                        .then((value) {
                          print("Sign In Successful");
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => QuestionPage(title: 'Questionnaire')),
                          );
                        }).catchError((error) {
                          print("Sign In Failed");
                          print(error.toString());
                        });
                  },
                  child: Text(
                    'Log In',
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
                  margin: EdgeInsets.only(left:2,right:10),
                  width:210,
                  child: OutlinedButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ForgotPasswordPage(title: '')),
                      );
                    },
                    child: Text(
                      'Forgot Password',
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
