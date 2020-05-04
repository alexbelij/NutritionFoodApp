
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/moredetails.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomeApp(),
    );
  }
}
class MyHomeApp extends StatefulWidget {
  @override
  _MyHomeAppState createState() => _MyHomeAppState();
}

class _MyHomeAppState extends State<MyHomeApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: ListView(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top:15.0, left:10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.arrow_back_ios),
                color: Colors.white,
                onPressed: (){},
              ),
              Container(
                width: 125.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon:Icon(Icons.filter_list),
                      color:Colors.white,
                      onPressed:(){},
                    ),
                    IconButton(
                      icon:Icon(Icons.menu),
                      color:Colors.white,
                      onPressed:(){},
                    ),
                  ],
                ),
              ),
            ],
          ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Padding(padding: EdgeInsets.only(left: 40.0),
          child: Row(
            children: <Widget>[
              Text(
                "Healthy",
                style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "Food",
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                ),
              )
            ],
          ),
          ),
          SizedBox(
            height: 40.0,
          ),
          Container(
            height: MediaQuery.of(context).size.height-100.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(80.0),
              ),
            ),
            child: ListView(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top:10.0),
                child: Container(
                  height: MediaQuery.of(context).size.height-300,
                  child: ListView(
                    children: <Widget>[
                      _buildFoodItem("images/22.jpg", "car cake", "\$24.0"),
                      _buildFoodItem("images/cake.jpg", "cake", "\$22.0"),
                      _buildFoodItem("images/11.jpg", "whitecake", "\$22.0"),

                    ],
                  ),
                ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: 65,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0)
                        ),
                        child: Center(
                          child: IconButton(icon: Icon(Icons.search),
                          onPressed: (){},),
                        ),
                      ),
                      Container(
                        height: 65,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.grey,

                            border: Border.all(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0)
                        ),
                        child: Center(
                          child: IconButton(icon: Icon(Icons.shopping_basket),
                            onPressed: (){},),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      )
      ,
    );
  }

Widget _buildFoodItem(String imgPath,String foodName,String price){
  return Padding(
    padding: const EdgeInsets.only(left: 30 , right: 10.0 , top: 30.0),
    child: InkWell(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(
             builder: (context) =>DetailsPage(heroTag: imgPath,foodName: foodName,foodPrice: price,)
            ));
            },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
                child: Row(
                  children: <Widget>[
                      Hero(
                          tag: imgPath,
                          child: Image(image: AssetImage(imgPath), fit: BoxFit.cover,
                                height: 60.0 ,width: 60.0,),
                          ),
                      SizedBox(width: 25.0),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                            foodName,
                            style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold
                            ),
                            ),
                        Text(
                             price,
                             style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold,color: Colors.grey),
                             ),
                    ],

                      ),

               ],
             ),
            ),
            IconButton(icon: Icon(Icons.add, color: Colors.black,
            ),
            onPressed: (){},),
        ],
        ),
    ),

  );
}}