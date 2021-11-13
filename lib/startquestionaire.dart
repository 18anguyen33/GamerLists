import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  var dropdownValueOne = 'None';
  var dropdownValueTwo = 'None';
  var dropdownValueThree = 'None';
  var dropdownValueFour = 'None';
  var dropdownValueFive = 'None';

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
                'Questionnaire',
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
              margin: EdgeInsets.all(10),
              child: Text(
                  'Note: You can choose None ignore the question.\nCaution: Certain combinations will remove all game entries from the listings',
                  textAlign: TextAlign.center,
                style: GoogleFonts.notoSerif(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                  'Question 1: What is your price range?',
                style: GoogleFonts.notoSerif(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  fontStyle: FontStyle.normal,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 10, right:10),
                height:35,
                child: SizedBox(
                  width: 300,
                  child:DropdownButton<String>(
                    isExpanded: true,
                  iconSize: 0.0,
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
                  items: <String>['\$0 - \$5', '\$5 - \$10', '\$10 - \$20', '\$20 - \$60', 'None']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                          value,
                        style: GoogleFonts.notoSerif(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          fontStyle: FontStyle.normal,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    );
                  }).toList(),
                ),)
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                  'Question 2: How old do you prefer to have your games?',
                style: GoogleFonts.notoSerif(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right:10),
              height:35,
              child: SizedBox(
                width: 300,
                child:DropdownButton<String>(
                  isExpanded: true,
                iconSize: 0.0,
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
                items: <String>['Newest Games (2021+)','Newish(2019-2020', 'Older(2010-2018', 'Old School(Pre 2010)', 'None']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: GoogleFonts.notoSerif(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  );
                }).toList(),
              ),)
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                  'Question 3: Do you like popular games or more underground games?',
                style: GoogleFonts.notoSerif(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right:10),
              height:35,
              child: SizedBox(
                width: 300,
                child:DropdownButton<String>(
                  isExpanded: true,
                iconSize: 0.0,
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
                items: <String>['Underground Games','Popular Games', 'None']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: GoogleFonts.notoSerif(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  );
                }).toList(),
              ),)
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                  'Question 4: Do you like mostly positive games or more negative games?',
                style: GoogleFonts.notoSerif(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right:10),
              height:35,
              child: SizedBox(
                width: 300,
                child:DropdownButton<String>(
                  isExpanded: true,
                iconSize: 0.0,
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
                items: <String>['Positively Rated Games','Neutral Rated Games', 'Negatively Rated Games', 'None']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: GoogleFonts.notoSerif(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  );
                }).toList(),
              ),)
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                  'Question 5: How much do you care about average user playtime?',
                style: GoogleFonts.notoSerif(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right:10),
              height:35,
              child: SizedBox(
                width: 300,
                child:DropdownButton<String>(
                  isExpanded: true,
                  iconSize: 0.0,
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
                items: <String>['Low Average Playtime','Medium Playtime', 'High Playtime', 'None']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(

                    value: value,
                    child: Text(
                      value,
                      style: GoogleFonts.notoSerif(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  );
                }).toList(),
              ),
              )
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right:10),
              width:372,
              child: OutlinedButton(
                onPressed: (){
                  inputData();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen(title: 'Home Page')),
                  );
                },
                child: Text(
                  'Submit',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.notoSerif(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
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
    final FirebaseAuth auth = FirebaseAuth.instance;
    void inputData(){
      if (auth.currentUser != null) {
        final User user = auth.currentUser!;
        final uid = user.uid;
        FirebaseFirestore.instance.collection('UserData').doc(uid).set(
            {"Question_One": dropdownValueOne,
              "Question_Two": dropdownValueTwo,
              "Question_Three": dropdownValueThree,
              "Question_Four": dropdownValueFour,
              "Question_Five": dropdownValueFive,
            });
      }
    }
}
