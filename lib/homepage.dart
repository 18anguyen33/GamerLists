import 'dart:math';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gamer_lists/startquestionaire.dart';
import 'categories.dart';
import 'dart:async';


class HomePage extends StatefulWidget {

  HomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  late DocumentSnapshot questions;
  final FirebaseAuth auth = FirebaseAuth.instance;
  void QuestionChange()async {
    final User user = auth.currentUser!;
    final uid = user.uid;
    questions = await FirebaseFirestore.instance.collection('UserData').doc(uid).get();
  }
  List categoryList = [];
  _HomeState(){
    FirebaseDatabase.instance.reference().child("0/main").once()
        .then((datasnapshot) {
      categoryList = datasnapshot.value;
      print("Successfully loaded data");
      setState(() {});
    }).catchError((error) {
      print("Failed to load data");
      print(error);
    });

  }
  @override
  Widget build(BuildContext context) {
    QuestionChange();
    return Scaffold(
        body: RefreshIndicator(
              onRefresh: _onRefresh,
              child: ListView.builder(
                    padding: const EdgeInsets.only(left: 5, right:5, top:25, bottom:5),
                    itemCount: categoryList.length,
                    physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                    itemBuilder: (BuildContext context, int index) {
                        return Card(
                          color: Colors.blueGrey[200],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>
                                      CategoriesPage(
                                          categoryList[index]['games'],
                                          '${categoryList[index]['category_name']}',
                                          questions))
                              );
                            },
                            title: Container(
                                height: 50,
                                child: Center(
                                    child: Text(
                                      categoryList[index]['category_name'],
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.notoSerif(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20,
                                        fontStyle: FontStyle.normal,
                                      ),
                                    )
                                )
                            )
                        ));
                      }
                    )));
  }
  Future<Null> _onRefresh() async{
    print("Loading Data");
    Completer<Null> completer = new Completer<Null>();
    new Future.delayed(new Duration (seconds: 1)).then((_){
      completer.complete();
    });
    return null;
  }
}

