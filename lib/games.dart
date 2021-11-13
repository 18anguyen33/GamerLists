import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        backgroundColor: Colors.blueGrey[200],
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.all(5),
                child: Card(
                    borderOnForeground: true,
                    child:Center(
                      child: Text(
                        "${widget.categoryDetails['name']}",
                        style: GoogleFonts.notoSerif(
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                        fontStyle: FontStyle.normal,
                        ),
                      )
                ))
              )
            ),
            Expanded(
                flex: 5,
                child: Container(
                    margin: EdgeInsets.all(5),
                    child: Card(
                        borderOnForeground: false,
                        child:Column(
                        children: [
                          Row(
                            children:[
                              Expanded(
                                flex: 5,
                                child: Container(
                                  margin: EdgeInsets.only(left: 10,right:5),
                                  child: Text(
                                    "Details",
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.notoSerif(
                                    fontWeight: FontWeight.w700,
                                      fontSize: 25,
                                      fontStyle: FontStyle.normal,
                                      color: Colors.blue[700],
                                    )
                                  )
                                )
                              )
                            ]
                          ),
                          Row(
                            children:[
                              Expanded(
                                flex: 5,
                                child: Container(
                                  margin: EdgeInsets.only(left: 10,right:5),
                                  child:Text(
                                  "Positive Ratings",
                                  style: GoogleFonts.notoSerif(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                    fontStyle: FontStyle.normal,
                                    color: Colors.grey[500]
                                  ),
                                ),
                                )
                              ),
                              Expanded(
                                flex: 5,
                                child: Text(
                                  "${widget.categoryDetails['positive_ratings']}",
                                  style: GoogleFonts.notoSerif(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ),
                            ]
                          ),
                          Row(
                              children:[
                                Expanded(
                                    flex: 5,
                                    child: Container(
                                      margin: EdgeInsets.only(left: 10,right:5,top:5),
                                      child:Text(
                                        "Negative Ratings",
                                        style: GoogleFonts.notoSerif(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20,
                                            fontStyle: FontStyle.normal,
                                            color: Colors.grey[500]
                                        ),
                                      ),
                                    )
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Text(
                                    "${widget.categoryDetails['negative_ratings']}",
                                    style: GoogleFonts.notoSerif(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                ),
                              ]
                          ),
                          Row(
                              children:[
                                Expanded(
                                    flex: 5,
                                    child: Container(
                                      margin: EdgeInsets.only(left: 10,right:5,top:5),
                                      child:Text(
                                        "Rating Percentage",
                                        style: GoogleFonts.notoSerif(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20,
                                            fontStyle: FontStyle.normal,
                                            color: Colors.grey[500]
                                        ),
                                      ),
                                    )
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Text(
                                    ""+(widget.categoryDetails['rating_percentage']*100).toStringAsFixed(3)+"\%",
                                    style: GoogleFonts.notoSerif(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                ),
                              ]
                          ),
                          Row(
                              children:[
                                Expanded(
                                    flex: 5,
                                    child: Container(
                                      margin: EdgeInsets.only(left: 10,right:5,top:5),
                                      child:Text(
                                        "Release Date",
                                        style: GoogleFonts.notoSerif(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20,
                                            fontStyle: FontStyle.normal,
                                            color: Colors.grey[500]
                                        ),
                                      ),
                                    )
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Text(
                                    "${widget.categoryDetails['release_date']}",
                                    style: GoogleFonts.notoSerif(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                ),
                              ]
                          ),
                          Row(
                              children:[
                                Expanded(
                                    flex: 5,
                                    child: Container(
                                      margin: EdgeInsets.only(left: 10,right:5,top:5),
                                      child:Text(
                                        "Developer",
                                        style: GoogleFonts.notoSerif(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20,
                                            fontStyle: FontStyle.normal,
                                            color: Colors.grey[500]
                                        ),
                                      ),
                                    )
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Text(
                                    "${widget.categoryDetails['developer']}",
                                    style: GoogleFonts.notoSerif(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                ),
                              ]
                          ),
                          Row(
                              children:[
                                Expanded(
                                    flex: 5,
                                    child: Container(
                                      margin: EdgeInsets.only(left: 10,right:5,top:5),
                                      child:Text(
                                        "Price",
                                        style: GoogleFonts.notoSerif(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20,
                                            fontStyle: FontStyle.normal,
                                            color: Colors.grey[500]
                                        ),
                                      ),
                                    )
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Text(
                                    "\$${widget.categoryDetails['price']}",
                                    style: GoogleFonts.notoSerif(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                ),
                              ]
                          ),
                        ]
                    ))
                )
            ),
            Expanded(
                flex: 3,
                child: Card(
                    child: Column(
                      children:[
                        Row(
                            children:[
                              Expanded(
                                  flex: 5,
                                  child: Container(
                                      margin: EdgeInsets.only(left: 10,right:5),
                                      child: Text(
                                          "Description",
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.notoSerif(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 25,
                                            fontStyle: FontStyle.normal,
                                            color: Colors.blue[700],
                                          )
                                      )
                                  )
                              )
                            ]
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                            child: Text(
                              "${widget.categoryDetails['short_description']}",
                              style: GoogleFonts.notoSerif(
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                                fontStyle: FontStyle.normal,
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
