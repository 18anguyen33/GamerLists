import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'games.dart';
import 'package:intl/intl.dart';

class CategoriesPage extends StatefulWidget {
  var categoryDetails;
  var title;
  var questionList;
  CategoriesPage(this.categoryDetails,this.title, this.questionList);
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.blueGrey[300],
        ),
        body: ListView.builder(
            padding: const EdgeInsets.all(5),
            itemCount: widget.categoryDetails.length,
            itemBuilder: (BuildContext context, int index){
              var currentDate = DateFormat('MM/dd/yyyy').parse(widget.categoryDetails[index]['release_date']);
              var newestCutoff = DateFormat('yyyy-MM-dd').parse('2021-00-00');
              var newishCutoff = DateFormat('yyyy-MM-dd').parse('2019-00-00');
              var OlderCutoff = DateFormat('yyyy-MM-dd').parse('2010-00-00');
              var pos = widget.categoryDetails[index]['positive_ratings'];
              var neg = widget.categoryDetails[index]['negative_ratings'];
              var total = pos + neg;
              if ((widget.questionList['Question_One'] == '\$0 - \$5' &&
                  widget.categoryDetails[index]['price']>5)||
                  (widget.questionList['Question_One'] == '\$5 - \$10' &&
                    widget.categoryDetails[index]['price']<5 &&
                    widget.categoryDetails[index]['price']>10)||
                  (widget.questionList['Question_One'] == '\$10 - \$20' &&
                      widget.categoryDetails[index]['price']<10 &&
                      widget.categoryDetails[index]['price']>20)||
                  (widget.questionList['Question_One'] == '\$20 - \$60' &&
                      widget.categoryDetails[index]['price']<20 &&
                      widget.categoryDetails[index]['price']>60)||
                  (widget.questionList['Question_Two'] == 'Newest Games (2021+)' &&
                      currentDate.isBefore(newestCutoff))||
                  (widget.questionList['Question_Two'] == 'Newish(2019-2020' &&
                      currentDate.isAfter(newestCutoff) &&
                      currentDate.isBefore(newishCutoff))||
                  (widget.questionList['Question_Two'] == 'Older(2010-2018' &&
                      currentDate.isAfter(newishCutoff) &&
                      currentDate.isBefore(OlderCutoff))||
                  (widget.questionList['Question_Two'] == 'Old School(Pre 2010)' &&
                      currentDate.isAfter(OlderCutoff))||
                  (widget.questionList['Question_Three'] == 'Underground Games' &&
                      total>=1000)||
                  (widget.questionList['Question_Three'] == 'Popular Games' &&
                      total<1000)||
                  (widget.questionList['Question_Four'] == 'Positively Rated Games' &&
                      widget.categoryDetails[index]['rating_percentage']<=0.9)||
                  (widget.questionList['Question_Four'] == 'Neutral Rated Games' &&
                      widget.categoryDetails[index]['rating_percentage']<0.7 &&
                      widget.categoryDetails[index]['rating_percentage']>0.9)||
                  (widget.questionList['Question_Four'] == 'Negatively Rated Games' &&
                      widget.categoryDetails[index]['rating_percentage']>=0.7)||
                  (widget.questionList['Question_Five'] == 'Low Average Playtime' &&
                      widget.categoryDetails[index]['median_playtime']>50)||
                  (widget.questionList['Question_Five'] == 'Medium Playtime' &&
                      widget.categoryDetails[index]['median_playtime']<50&&
                      widget.categoryDetails[index]['median_playtime']>100)||
                  (widget.questionList['Question_Five'] == 'High Playtime' &&
                      widget.categoryDetails[index]['median_playtime']<100)
              ){
                return SizedBox.shrink();
              }
              else {
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
                            GamesPage(widget.categoryDetails[index],
                                '${widget.categoryDetails[index]['name']}')),
                      );
                    },
                    title: Container(
                        child: Center(
                          child: Column(
                              children: [
                                Row(
                                    children: [
                                      Expanded(
                                          flex: 5,
                                          child: Row(
                                              children:[Icon(
                                                Icons.title,
                                                color: Colors.black,
                                                size: 15,
                                              ),
                                                Container(
                                                  margin: EdgeInsets.only(top:5, bottom:5),
                                                child: Text(
                                                  "${widget
                                                      .categoryDetails[index]['name']}",
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.notoSerif(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 10,
                                                    fontStyle: FontStyle.normal,
                                                  ),
                                                ),
                                              ),
                                          ])
                                      ),
                                      Align(
                                          alignment: Alignment.centerRight,
                                          child:Expanded(
                                          flex: 5,
                                          child: Row(
                                              children:[
                                                Container(
                                                child:Icon(
                                                  Icons.monetization_on_outlined,
                                                  color: Colors.yellow,
                                                  size: 15,
                                                ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(top:5, bottom:5),
                                                child: Text(
                                                  "${widget
                                                      .categoryDetails[index]['price']}",
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.notoSerif(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 10,
                                                    fontStyle: FontStyle.normal,
                                                  ),
                                                ),
                                              ),
                                          ])
                                      ),
                                      ),
                                    ]
                                ),
                                Container(
                                  margin: EdgeInsets.only(top:5, bottom:5),
                                  child: Text(
                                    "${widget
                                        .categoryDetails[index]['short_description']}",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.notoSerif(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 10,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                ),
                              ]
                          ),
                        )
                    )

                ));
              }
            }
        )
    );
  }
}
