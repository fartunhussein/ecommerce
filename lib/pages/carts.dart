import 'package:flutter/material.dart';
import 'package:ecommerce/components/cart_products.dart';
class Carts extends StatefulWidget {
  @override
  _CartsState createState() => _CartsState();
}

class _CartsState extends State<Carts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Colors.teal[800],
        title: Text('Shopping Cart'),
     actions: <Widget>[
       new IconButton(icon: Icon(Icons.search), color:Colors.white,onPressed: (){}),
      
     ],
     
      ),

      body: new Cart_Products(),

      bottomNavigationBar: new Container(
        color: Colors.white,
        child:new Row(children: <Widget>[
        Expanded(child: ListTile(
          title: new Text("Total:"),
          subtitle:new Text("\$230"),

        ),),

        Expanded(child: new MaterialButton(onPressed:(){} ,
        child: new Text("Check out", style:TextStyle(color:Colors.white)),
         color: Colors.teal[800],))


        ],)
      ),
    );
  }
}