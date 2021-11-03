import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                  'Create a New Account',
                  style: TextStyle(
                    fontSize: 30,
                  )
              ),
            ),
            // Container(
            //     margin: EdgeInsets.only(left: 10, right:10),
            //     height:35,
            //     child: TextField(
            //       obscureText: false,
            //       decoration: InputDecoration(
            //         border: OutlineInputBorder(),
            //         labelText: 'Username',
            //       ),
            //     )
            // ),
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
                )
            ),
            // Container(
            //     margin: EdgeInsets.only(left: 10, right:10, top:5),
            //     height:35,
            //     child: TextField(
            //       obscureText: true,
            //       decoration: InputDecoration(
            //         border: OutlineInputBorder(),
            //         labelText: 'Confirm Password',
            //       ),
            //     )
            // ),
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
                )
            ),
            Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 10, right:10),
                    width:372,
                    child: OutlineButton(
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
                        style: TextStyle(
                          fontSize: 15,
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
