import 'package:flutter/material.dart';
import 'login.dart';
import 'signup.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Gamer List Login'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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
              width:300,
              height:200,
              child: Image(
                  image: AssetImage('images/Stockholder.jpg')
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                'Welcome to Gamer Lists',
                style: TextStyle(
                  fontSize: 30,
                )
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right:10),
              width:320,
              child: OutlineButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage(title: 'User Login')),
                  );
                },
                child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right:10),
              width:320,
              child: OutlineButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpPage(title: 'Create Account')),
                  );
                },
                child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right:10),
              width:320,
              child: FlatButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen(title: 'Home Page')),
                  );
                },
                child: Text(
                    'Skip',
                    style: TextStyle(
                      fontSize: 12,
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
