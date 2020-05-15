import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:ecommerce/components/horizontal_listview.dart';
import 'package:ecommerce/components/products.dart';
import 'package:ecommerce/pages/carts.dart';
import 'package:ecommerce/pages/settings.dart';





class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget image_carousel = new Container(
       height: 200.0,
       child: new Carousel(
         boxFit: BoxFit.cover,
         images:[
              AssetImage('images/a.png'),
              AssetImage('images/b.png'),
              AssetImage('images/c.png'),
              AssetImage('images/d.png'),
              AssetImage('images/e.png'),

         ],
         autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
     animationDuration: Duration(milliseconds:1000),
      dotSize: 4.0,
      dotColor: Colors.teal[800],
      indicatorBgPadding:2.0 ,
       dotBgColor: Colors.transparent, ),

    );
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Colors.teal[800],
        title: Text('Al-Wahab Interior'),
     actions: <Widget>[
       new IconButton(icon: Icon(Icons.search), color:Colors.white,onPressed: (){}),
       new IconButton(icon: Icon(Icons.shopping_cart), color:Colors.white,onPressed: (){
         Navigator.push(context, MaterialPageRoute(builder: (context)=> new Carts()));
       })
     ],
     
      ),//appbar
     drawer: new Drawer(//drawer
      child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: Text('Ilyas Hussein'),
             accountEmail: Text('ilyashussein@gmail.com'),
            currentAccountPicture: GestureDetector(
              child: new CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, color: Colors.white,
              ),
            ),),

            decoration: new BoxDecoration(
              color: Colors.teal[800],
            ),
        
            ),// body

            InkWell(
              onTap: (){},
            child: ListTile(
                title:Text('Home Page') ,
                leading: Icon(Icons.home, color: Colors.teal[800]),
              ),
            ),

             InkWell(
              onTap: (){},
            child: ListTile(
                title:Text('My Account') ,
                leading: Icon(Icons.person, color: Colors.teal[800]),
              ),
            ),

             InkWell(
              onTap: (){},
            child: ListTile(
                title:Text('My orders') ,
                leading: Icon(Icons.shopping_basket, color: Colors.teal[800]),
              ),
            ),

             InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> new Carts()));
              },
            child: ListTile(
                title:Text('Shopping Cart') ,
                leading: Icon(Icons.shopping_cart, color: Colors.teal[800]),
              ),
            ),

             InkWell(
              onTap: (){},
            child: ListTile(
                title:Text('Favourites') ,
                leading: Icon(Icons.favorite, color: Colors.teal[800]),
              ),
            ),
            Divider(),


           InkWell(
              onTap: (){
                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SettingPage()));
              },
            child: ListTile(
                title:Text('Settings') ,
                leading: Icon(Icons.settings),
              ),
            ),


             InkWell(
              onTap: (){},
            child: ListTile(
                title:Text('About') ,
                leading: Icon(Icons.help),
              ),
            )
          ],
  )
),

body: new Column(
  children: <Widget>[
    image_carousel,

    //padding widget
    new Padding(padding: const EdgeInsets.all(4.0),
    child: new Text('Categories'),),
  
  //horizontal listview begins here

    HorizontalList(),

   //padding widget
    new Padding(padding: const EdgeInsets.all(4.0),
    child: new Text('Products'),),
  
  //grid view
  
  Flexible(
    child: Products(),),
  
  ],
)

    );
  }
}