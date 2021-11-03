import 'package:flutter/material.dart';
import 'home.dart';

class QuestionPage extends StatefulWidget {
  QuestionPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<QuestionPage> {
  String dropdownValueOne = '\$0 - \$5';
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
                  items: <String>['\$0 - \$5', '\$5 - \$10', '\$10 - \$20', '\$20 - \$60','\$60+']
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
}
