import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                  'Login to Your Account',
                  style: TextStyle(
                    fontSize: 30,
                  )
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
                )
            ),
            Row(
              children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 10, right:10),
                width:180,
                child: OutlineButton(
                  onPressed: (){
                    FirebaseAuth.instance.signInWithEmailAndPassword(
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
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
                Container(
                  margin: EdgeInsets.only(left: 10, right:10),
                  width:170,
                  child: FlatButton(
                    onPressed: (){

                    },
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
             ]
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
