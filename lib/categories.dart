import 'package:flutter/material.dart';
import 'games.dart';

class CategoriesPage extends StatefulWidget {
  var categoryDetails;
  var title;
  CategoriesPage(this.categoryDetails,this.title);
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<CategoriesPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView.builder(
            padding: const EdgeInsets.all(5),
            itemCount: widget.categoryDetails.length,
            itemBuilder: (BuildContext context, int index){
              return ListTile(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GamesPage(widget.categoryDetails[index],'${widget.categoryDetails[index]['name']}')),
                    );
                  },
                  title: Container(
                      color: Colors.grey[300],
                      child: Center(
                          child: Column(
                              children: [
                                Row(
                                    children: [
                                      Expanded(
                                        flex: 5,
                                        child: Container(
                                          margin: EdgeInsets.all(5),
                                          child: Text(
                                            "${widget.categoryDetails[index]['name']}",
                                            textAlign: TextAlign.center,
                                          ),
                                        )
                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: Container(
                                          margin: EdgeInsets.all(5),
                                          child: Text(
                                            "${widget.categoryDetails[index]['price']}",
                                            textAlign: TextAlign.center,
                                          ),
                                        )
                                      ),
                                    ]
                                ),
                                Container(
                                  margin: EdgeInsets.all(5),
                                  child: Text(
                                    "${widget.categoryDetails[index]['short_description']}",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                )
                              ]
                          ),
                      )
                  )

              );
            }
        )
    );
  }

}
