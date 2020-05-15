import 'package:flutter/material.dart';
import 'package:ecommerce/pages/home.dart';
import 'package:ecommerce/pages/carts.dart';

class ProductDetails extends StatefulWidget {
  final product_detail_name;
  final product_detail_new_price;
  final product_detail_old_price;
  final product_detail_picture;

  ProductDetails({

    this.product_detail_name,
    this.product_detail_new_price,
    this.product_detail_old_price,
    this.product_detail_picture
  });
  
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Colors.teal[800],
        title: InkWell
          ( onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> new HomePage()));
            
          },
            child: Text('Al-Wahab Interior')),
     actions: <Widget>[
       new IconButton(icon: Icon(Icons.search), color:Colors.white,onPressed: (){}),
       
     ],
     
      ),

      body: new ListView(
    children: <Widget>[
    new Container(
      height: 300.0,
     child: GridTile(
     child:Container(
       color: Colors.white,
       child:Image.asset(widget.product_detail_picture)


     ),
     footer: new Container(
       color: Colors.white,
       child:ListTile(
        leading: new Text(
           widget.product_detail_name,
          style: TextStyle(fontWeight:FontWeight.bold, fontSize:16.0),),
         title: new Row(
           children:<Widget>[
Expanded(child: new Text("kshs${widget.product_detail_old_price}",
style: TextStyle(color:Colors.grey, decoration:TextDecoration.lineThrough),
),
),
Expanded(child: new Text("kshs${widget.product_detail_new_price}",
style:TextStyle(color: Colors.teal[800], fontWeight: FontWeight.w800)

),
),


           ],
         ),
       ) ,),
     ),
    ),
    //.....the first button......
Row(
  children:<Widget>[
    // ......the size button.....
    Expanded(
      child:MaterialButton(onPressed:(){
        showDialog(context: context,
        builder: (context) {
          return new AlertDialog(

            title: new Text("size"),
            content: new Text('choose a size'),
            actions: <Widget>[
              new MaterialButton(onPressed: (){
                Navigator.of(context).pop(context);
              },
              child: new Text("close", style: TextStyle(color:Colors.teal[800])),)
            ],
          );
        },
        );
      },
      color:Colors.white,
      elevation: 0.2,
      child:Row(children: <Widget>[
          Expanded(child: new Text("size"),),
          Expanded(child: new Icon(Icons.arrow_drop_down),)


      ],)
      
      )
    ),

    Expanded(
      child:MaterialButton(onPressed:(){
         showDialog(context: context,
        builder: (context) {
          return new AlertDialog(

            title: new Text("Colors"),
            content: new Text('choose a color'),
            actions: <Widget>[
              new MaterialButton(onPressed: (){
                Navigator.of(context).pop(context);
              },
              child: new Text("close", style: TextStyle(color:Colors.teal[800])),),
            ],
          );
        },
        );
      
      },
      color:Colors.white,
      elevation: 0.2,
      child:Row(children: <Widget>[
         Expanded(child: new Text("Color"),),
         Expanded(child: new Icon(Icons.arrow_drop_down),)


      ],)
      
      )
    ),

    Expanded(
      child:MaterialButton(onPressed:(){

       showDialog(context: context,
        builder: (context) {
          return new AlertDialog(

            title: new Text("Quantity"),
            content: new Text('choose a Quantity'),
            actions: <Widget>[
              new MaterialButton(onPressed: (){
                Navigator.of(context).pop(context);
              },
              child: new Text("close", style: TextStyle(color:Colors.teal[800])),)
            ],
          );
        },
        );
      },
      color:Colors.white,
      elevation: 0.2,
      child:Row(children: <Widget>[
         Expanded(child: new Text("Qty"),),
         Expanded(child: new Icon(Icons.arrow_drop_down),)


      ],)
      
      )
    ),
  ],
),
 // the 2nd button

 Row(
  children:<Widget>[
    // ......the size button.....
    Expanded(
      child:MaterialButton(onPressed:(){},
      color:Colors.teal[800],
      elevation: 0.0,
      child: new Text("Buy now"),
      ),
      
      ),
      new IconButton(icon: Icon(Icons.add_shopping_cart),color:Colors.redAccent, onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=> new Carts()));
      }),
      new IconButton(icon: Icon(Icons.favorite_border),color: Colors.redAccent, onPressed: (){})
      

      ],
    ),
  Divider(),
    new ListTile(
      title: new Text("Product details"),
      subtitle: new Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop "),
      
    ),
Divider(),
Row(
  children:<Widget>[
Padding (padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
child: new Text("Product name", style:TextStyle(color:Colors.grey)),),
  Padding(padding: EdgeInsets.all(5.0),
  child:new Text(widget.product_detail_name)
   ),  ],
),

Row(
  children:<Widget>[
Padding (padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
child: new Text("Product Brand", style:TextStyle(color:Colors.grey))),

 //....REMEMBER TO CREATE THE PRODUCT BRAND
 
  Padding(padding: EdgeInsets.all(5.0),
  child:new Text("brand x")
    
  ),  ],
),
 // .....ADD the PRODUCT CONDITION
Row(
  children:<Widget>[
Padding (padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
child: new Text("Product Condition", style:TextStyle(color:Colors.grey))
  ),
  
   Padding(padding: EdgeInsets.all(5.0),
  child:new Text("new")
   ),    ],
),
Divider(), 
Padding(padding: const EdgeInsets.all(8.0),
child: new Text("Similar Products"),
),

//..SIMILAR PRODUCTS SECTION
Container(
  height:360.0,
  child:SimilarProducts(),
   )
    ],

      ),
    );
  }
}





class SimilarProducts extends StatefulWidget {
  @override
  _SimilarProductsState createState() => _SimilarProductsState();
}

class _SimilarProductsState extends State<SimilarProducts> {
  @override

  var product_list =[

   {
     "name": "net" ,
     "picture" : "images/products/one.png",
     "old_price": "2000" ,
     "price": "1500",


   },


    {
     "name": "carpet" ,
     "picture" : "images/products/laba.png",
     "old_price": "20000" ,
     "price": "15000",

   },
      {
     "name": "mat" ,
     "picture" : "images/products/mat.png",
     "old_price": "20000" ,
     "price": "15000",

   },
      {
     "name": "Pillow" ,
     "picture" : "images/products/pillow.png",
     "old_price": "20000" ,
     "price": "15000",

   },  
    {
     "name": "Baby's net" ,
     "picture" : "images/products/kow.png",
     "old_price": "20000" ,
     "price": "15000",

   }

  


 ];
  Widget build(BuildContext context) {
   itemCount: product_list.length;
    return GridView.builder(gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
     itemBuilder: (BuildContext context, int index){

       return Similar_single_prod(
         product_name: product_list[index]["name"],
         prod_picture: product_list[index]["picture"],
         prod_old_price: product_list[index]["old_price"],
         prod_price: product_list[index]["price"],
       );
     }
      
    );
  }
}
class Similar_single_prod extends StatelessWidget {
  final product_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  Similar_single_prod({

    this.product_name,
    this.prod_picture,
    this.prod_old_price,
    this.prod_price,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
         tag: new Text("hero 1"),
         child: Material(
           child: InkWell(
             onTap:()=> Navigator.of(context).push(new MaterialPageRoute(builder: 
           (context)=>  ProductDetails( 
             //here we are passing the values of the product to the product detail page
             product_detail_name: product_name,
             product_detail_new_price: prod_price,
             product_detail_old_price: prod_old_price,
             product_detail_picture: prod_picture,
           ))) ,


           child: GridTile(
             footer: Container(
             color:Colors.white,
             child: new Row(
             children:<Widget>[
                Expanded(child: Text(product_name , style: TextStyle(fontWeight:FontWeight.bold)),),
                new Text("\kshs${prod_price}", style:TextStyle(color: Colors.teal[800])),

             ],

             ),
          ),
           child: Image.asset(
             prod_picture,
             fit:BoxFit.cover,
           ),
           
           ),
           )
         ),

      ),
      
    );
  }
}