
import 'package:flutter/material.dart';

class PersonalInfoPage extends StatefulWidget {
  PersonalInfoPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _PersonalInfoState createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfoPage> {
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
                  'Change Your Password',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                  )
              ),
            ),
            Row(
              children: [
                Container(
                    margin: EdgeInsets.only(left: 10,right: 5),
                    height:35,
                    width:285,
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'New Password',
                      ),
                    )
                ),
                Container(
                  margin: EdgeInsets.only(right:10),
                  width:80,
                  child: OutlineButton(
                    onPressed: (){

                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                  'Change Your Email',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                  )
              ),
            ),
            Row(
              children: [
                Container(
                    margin: EdgeInsets.only(left: 10,right: 5),
                    height:35,
                    width:285,
                    child: TextField(
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'New Email',
                      ),
                    )
                ),
                Container(
                  margin: EdgeInsets.only(right:10),
                  width:80,
                  child: OutlineButton(
                    onPressed: (){

                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
