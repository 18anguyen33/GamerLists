import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login.dart';
import 'signup.dart';
import 'home.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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

      body: Center(

        child: Column(
          children: <Widget>[
            Container(
              width:3900,
              height:290,
              child: Image(
                  image: AssetImage('images/Logo.jpg')
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom:10),
              child: Text(
                'Welcome to Gamer Lists',
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
              width:380,
              child: OutlinedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage(title: 'User Login')),
                  );
                },
                child: Text(
                    'Login',
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
              width:380,
              child: OutlinedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpPage(title: 'Create Account')),
                  );
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
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
