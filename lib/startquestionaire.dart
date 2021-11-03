import 'package:flutter/material.dart';
import 'home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class QuestionPage extends StatefulWidget {
  QuestionPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<QuestionPage> {
  var dropdownValueOne = '\$0 - \$5';
  var dropdownValueTwo = 'Newest Games (2021+)';
  var dropdownValueThree = 'Action';
  var dropdownValueFour = 'Underground Games';
  var dropdownValueFive = 'Positively Rated Games';
  var dropdownValueSix = 'Low Average Playtime';

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
                  'Welcome to the Questionnaire. \nYou can choose None to not have the question apply.',
                  style: TextStyle(
                    fontSize: 15,
                  )
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                  'Question 1: What is your price range?',
                  style: TextStyle(
                    fontSize: 15,
                  )
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 10, right:10),
                height:35,
                child: DropdownButton<String>(
                  value: dropdownValueOne,
                  style: const TextStyle(color: Colors.blue),
                  underline: Container(
                    height: 2,
                    color: Colors.blueAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValueOne = newValue!;
                    });
                  },
                  items: <String>['\$0 - \$5', '\$5 - \$10', '\$10 - \$20', '\$20 - \$60','\$60+', 'None']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                  'Question 2: How old do you prefer to have your games?',
                  style: TextStyle(
                    fontSize: 15,
                  )
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right:10),
              height:35,
              child: DropdownButton<String>(
                value: dropdownValueTwo,
                style: const TextStyle(color: Colors.blue),
                underline: Container(
                  height: 2,
                  color: Colors.blueAccent,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValueTwo = newValue!;
                  });
                },
                items: <String>['Newest Games (2021+)','Newish(2019-2020', 'Older(2015-2018', 'Old School(Pre 2015)', 'None']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                  'Question 3: What Genre do you like the most?',
                  style: TextStyle(
                    fontSize: 15,
                  )
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right:10),
              height:35,
              child: DropdownButton<String>(
                value: dropdownValueThree,
                style: const TextStyle(color: Colors.blue),
                underline: Container(
                  height: 2,
                  color: Colors.blueAccent,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValueThree = newValue!;
                  });
                },
                items: <String>['Action', 'Free to Play', 'Massively Multiplayer', 'Sports',
                  'Early Access', 'Gore', 'Animation & Modeling', 'Video Production',
                  'Utilities', 'Design & Illustration', 'Web Publishing', 'Education',
                  'Strategy', 'Software Training', 'Audio Production', 'Game Development',
                  'Photo Editing', 'Adventure', 'Indie', 'RPG', 'Casual', 'Simulation',
                  'Racing', 'Violent'
                ]
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                  'Question 4: Do you like popular games or more underground games?',
                  style: TextStyle(
                    fontSize: 15,
                  )
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right:10),
              height:35,
              child: DropdownButton<String>(
                value: dropdownValueFour,
                style: const TextStyle(color: Colors.blue),
                underline: Container(
                  height: 2,
                  color: Colors.blueAccent,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValueFour = newValue!;
                  });
                },
                items: <String>['Underground Games','Popular Games', 'None']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                  'Question 5: Do you like mostly positive games or more negative games?',
                  style: TextStyle(
                    fontSize: 15,
                  )
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right:10),
              height:35,
              child: DropdownButton<String>(
                value: dropdownValueFive,
                style: const TextStyle(color: Colors.blue),
                underline: Container(
                  height: 2,
                  color: Colors.blueAccent,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValueFive = newValue!;
                  });
                },
                items: <String>['Positively Rated Games','Neutral Rated Games', 'Negatively Rated Games', 'None']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                  'Question 6: How much do you care about average user playtime?',
                  style: TextStyle(
                    fontSize: 15,
                  )
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right:10),
              height:35,
              child: DropdownButton<String>(
                value: dropdownValueSix,
                style: const TextStyle(color: Colors.blue),
                underline: Container(
                  height: 2,
                  color: Colors.blueAccent,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValueSix = newValue!;
                  });
                },
                items: <String>['Low Average Playtime','Medium Playtime', 'High Playtime', 'None']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right:10),
              width:372,
              child: OutlineButton(
                onPressed: (){
                  inputData();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen(title: 'Home Page')),
                  );
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
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
    final FirebaseAuth auth = FirebaseAuth.instance;
    void inputData(){
      if (auth.currentUser != null) {
        final User user = auth.currentUser!;
        final uid = user.uid;
        print(uid);
        FirebaseFirestore.instance.collection('UserData').doc(uid).set(
            {"Question_One": dropdownValueOne,
              "Question_Two": dropdownValueTwo,
              "Question_Three": dropdownValueThree,
              "Question_Four": dropdownValueFour,
              "Question_Five": dropdownValueFive,
              "Question_Six": dropdownValueSix
            });
      }
    }
}
