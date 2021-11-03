import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GamesPage extends StatefulWidget {
  var categoryDetails;
  var title;
  GamesPage(this.categoryDetails,this.title);
  @override
  _GamesState createState() => _GamesState();
}

class _GamesState extends State<GamesPage> {

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
            Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.all(5),
                child: Center(
                    child: Text(
                      "${widget.categoryDetails['name']}",
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    )
                )
              )
            ),
            Expanded(
                flex: 4,
                child: Container(
                    margin: EdgeInsets.all(5),
                    child: Center(
                      child: Text(
                        "${widget.categoryDetails['short_description']}",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      )
                    )
                )
            ),
            Expanded(
                flex: 4,
                child: Container(
                    margin: EdgeInsets.all(5),
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            "${widget.categoryDetails['positive_ratings']}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          )
                        ),
                        Center(
                            child: Text(
                              "${widget.categoryDetails['release_date']}",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            )
                        ),
                        Center(
                            child: Text(
                              "${widget.categoryDetails['developer']}",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            )
                        ),
                        Center(
                            child: Text(
                              "${widget.categoryDetails['price']}",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            )
                        )
                      ]
                    )
                )
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
