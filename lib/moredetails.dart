import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class DetailsPage extends StatefulWidget {
  final heroTag;
  final foodName;
  final foodPrice;
  DetailsPage({this.heroTag,this.foodName,this.foodPrice});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  var selectedCard="WEIGHT";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: Colors.transparent,
        elevation: 1.0,
        title: Text("Details",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22.0,),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.more_horiz),
          onPressed: (){},),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height-100,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
              ),
              Positioned(
                top: 75.0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(45.0),
                    topRight: Radius.circular(45.0),),
                    color: Colors.white,),
                  height: MediaQuery.of(context).size.height-100,
                    width: MediaQuery.of(context).size.width,
                ),
              ),
              Positioned(
                top: 30.0,
                left: (MediaQuery.of(context).size.width/2)-100.00,
                child: Hero(
                  tag: widget.heroTag,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      image: DecorationImage(
                        image: AssetImage(widget.heroTag),
                        fit: BoxFit.cover,)
                    ),
                    height: 200.0,
                    width: 200.0,
                  ),
                ),
              ),
              Positioned(
                top: 250.0,
                left: 25.0,
                right: 25.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.foodName,
                    style: TextStyle(fontSize: 22,
                    color: Colors.blueGrey),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(widget.foodPrice,
                          style: TextStyle(fontSize: 16,
                              color: Colors.blueGrey),
                        ),
                        Container(
                          height: 25.0,width: 1.0 ,color: Colors.grey,
                        ),
                        Container(
                          width: 125.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14.0),
                            color: Colors.blueAccent,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              InkWell(
                                onTap: (){},
                              child: Container(
                                height: 25.0,
                                width: 25.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.0),
                                  color: Colors.indigo,
                                ),
                                child: Center(
                                  child: Icon(Icons.remove, size: 25,color: Colors.white,),
                                ),
                              ),
                              ),
                              Text("2",style: TextStyle(fontSize: 20.0,
                              fontWeight: FontWeight.bold,color: Colors.white),),
                              InkWell(
                                onTap: (){},
                                child: Container(
                                  height: 25.0,
                                  width: 25.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.0),
                                    color: Colors.indigo,),
                                         child: Center(
                                                 child: Icon(Icons.add, size: 25,
                                                   color: Colors.white,),
                                                   ),

                                ),

                              )
                            ],
                          ),
                        )
                      ],

                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Container(
                      height: 100.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          _buildInfoCard("WEIGHT", "300", "G"),
                          _buildInfoCard("CALORIES", "267", "CAL"),
                          _buildInfoCard("VITAMINS", "30", "VI"),
                          _buildInfoCard("AVAIL", "300", "AV"),
                        ],
                      ),
                    )
                  ],
                ),

              )
            ],
          )
        ],
      ),
    );
  }
  Widget _buildInfoCard(String cardTitle, String title,String unit){
    return InkWell(
      onTap: (){
        selectCard(cardTitle);
      },
      child: AnimatedContainer(duration: Duration(milliseconds: 500),
      curve: Curves.easeIn,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.0),
        color: cardTitle==selectedCard ? Colors.blueAccent : Colors.white,
        border: Border.all(
          color: cardTitle==selectedCard ? Colors.blue : Colors.grey,
        ),
      ),
        height: 100.00,
        width: 80.00,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0,left: 15.0),
              child: Text(
                cardTitle,style: TextStyle( fontSize: 10.0,),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(bottom: 8.0,left: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(title,style: TextStyle(
                    fontSize: 10.0,
                    color: cardTitle==selectedCard ? Colors.white : Colors.black,
                  ),
                  ),
                  Text(unit,style: TextStyle(
                    fontSize: 10.0,
                    color: cardTitle==selectedCard ? Colors.white : Colors.black,
                  ),
                  )
                ],
              ),

            )
          ],
        ),
      ),
    );
  }
  selectCard(cardTitle){
    setState(() {
      selectedCard=cardTitle;
    });
  }
}
