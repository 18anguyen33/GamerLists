import 'package:flutter/material.dart';
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
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              child: OutlineButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PersonalInfoPage(title: 'Personal User Information')),
                  );
                },
                child: Text(
                  'Modify Personal User Information',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 10, right:10),
                height:35,
                child: OutlineButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => QuestionPage(title: 'Questionnaire')),
                    );
                  },
                  child: Text(
                    'Retake User Questionnaire',
                    style: TextStyle(
                      fontSize: 15,
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
