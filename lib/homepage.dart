import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'categories.dart';
import 'package:mobx/mobx.dart';
import 'dart:async';


class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  @observable
  List categoryList = [];
  _HomeState(){
    FirebaseDatabase.instance.reference().child("0/main").once()
        .then((datasnapshot) {
      categoryList = datasnapshot.value;
      print("Successfully loaded data");
    }).catchError((error) {
      print("Failed to load data");
      print(error);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
        body: RefreshIndicator(
              onRefresh: _onRefresh,
              child: ListView.builder(
                    padding: const EdgeInsets.all(5),
                    itemCount: categoryList.length,
                    physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                    itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>
                                      CategoriesPage(
                                          categoryList[index]['games'],
                                          '${categoryList[index]['category_name']}'))
                              );
                            },
                            title: Container(
                                height: 50,
                                color: Colors.grey[300],
                                child: Center(
                                    child: Text(
                                      categoryList[index]['category_name'],
                                      textAlign: TextAlign.center,
                                    )
                                )
                            )
                        );
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

