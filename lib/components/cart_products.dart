
import 'package:flutter/material.dart';

class Cart_Products extends StatefulWidget {
  @override
  _Cart_ProductsState createState() => _Cart_ProductsState();
}

class _Cart_ProductsState extends State<Cart_Products> {
  var Products_on_the_carts=[
   {
     "name": "Pillow" ,
     "picture" : "images/products/pillow.png",
     "price": "500",
      "size": "5x8",
      "color":"blue",
      "quantity":"1"
   },  

    {
     "name": "Baby's net" ,
     "picture" : "images/products/kow.png",
     "price": "1500",
      "size": "5x8",
      "color":"blue",
      "quantity":"1"
   }, {
     "name": "Baby's net" ,
     "picture" : "images/products/kow.png",
     "price": "1500",
      "size": "5x8",
      "color":"blue",
      "quantity":"1"
   }
    ];
  
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount:Products_on_the_carts.length,
      itemBuilder: (context, index){
        return Single_carts_product(
        cart_product_name: Products_on_the_carts[index]["name"],
         cart_prod_color:Products_on_the_carts[index]["color"],
         cart_prod_quantity:Products_on_the_carts[index]["quantity"],
        cart_prod_size:Products_on_the_carts[index]["size"],
        cart_prod_price:Products_on_the_carts[index]["price"],
        cart_prod_picture:Products_on_the_carts[index]["picture"],

     ); });
  }
}

class Single_carts_product extends StatelessWidget {
  
   final cart_product_name;
   final cart_prod_picture;
   final  cart_prod_size;
   final cart_prod_price;
   final cart_prod_color;
   final cart_prod_quantity;

//constructor for the above variables
  Single_carts_product({
    this.cart_product_name,
    this.cart_prod_picture,
    this.cart_prod_size,
    this.cart_prod_price,
    this.cart_prod_color,
    this.cart_prod_quantity
  });
  
  
  @override
  Widget build(BuildContext context) {
    return Card(
      
      child: ListTile(
       //leading section here
        leading: new Image.asset(cart_prod_picture, width:80.0, height: 80.0,),
        
        //======TITLE SECTION
        title:new Text(cart_product_name),
      
      //======SUBTITLE SECTION
        subtitle: new Column(
          children:<Widget>[
// ......A ROW INSIDE OF A COLUMN
            new Row(children: <Widget>[
            // ======this section for the size
        Padding(padding: const EdgeInsets.all(0.0),
        child: new Text("size:"),
        ),

        Padding(padding: const EdgeInsets.all(4.0),
        child:new Text(cart_prod_size, style:TextStyle(color: Colors.teal[800]))),


        //This section is for the color
        new Padding(padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
        child: new Text("Color:"),),
        
        
        Padding(padding: const EdgeInsets.all(0.0),
        child: new Text(cart_prod_color, style:TextStyle(color: Colors.teal[800]))),

            ],),

      //====THIS SECTION IS FOR THE PRODUCT PRICE====
      new Container(
    
        alignment: Alignment.topLeft,
        child: new Text("\Kshs${cart_prod_price}", style:TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
          color: Colors.teal[800])),
      )
          ],
        ),
        //trailing: new Column(
       //   children:<Widget>[
        //  new IconButton(icon:Icon(Icons.arrow_drop_up),alignment: Alignment.topRight,onPressed: (){},),
        //  new IconButton(icon:Icon(Icons.arrow_drop_down), alignment: Alignment.bottomRight, onPressed: (){},),
//],),
      ),
    );
  }
}