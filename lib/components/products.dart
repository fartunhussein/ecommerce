import 'package:flutter/material.dart';
import 'package:ecommerce/pages/product_details.dart';
class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
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

   },{
     "name": "Baby's net" ,
     "picture" : "images/products/kow.png",
     "old_price": "20000" ,
     "price": "15000",

   },{
     "name": "Baby's net" ,
     "picture" : "images/products/kow.png",
     "old_price": "20000" ,
     "price": "15000",

   },{
     "name": "Baby's net" ,
     "picture" : "images/products/kow.png",
     "old_price": "20000" ,
     "price": "15000",

   }

  


 ];
 
  @override
  Widget build(BuildContext context) {
    
    return GridView.builder(gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
     itemCount: product_list.length,itemBuilder: (BuildContext context, int index){

       return Single_prod(
         product_name: product_list[index]["name"],
         prod_picture: product_list[index]["picture"],
         prod_old_price: product_list[index]["old_price"],
         prod_price: product_list[index]["price"],
       );
     }
      
    );
  }
}

class Single_prod extends StatelessWidget {
  final product_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  Single_prod({

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