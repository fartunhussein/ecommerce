import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            image_location: 'images/carts/1.png',
            image_caption: 'carpets',
          ),

          Category(
            image_location: 'images/carts/4.png',
            image_caption: 'duvets',
          ),

          Category(
            image_location: 'images/carts/6.png',
            image_caption: 'door mats',
          ),
        
    Category(
            image_location: 'images/carts/3.png',
            image_caption: 'wallpaper',
          ),
        

        ],

      ),
      
    );
  }
}

class Category extends StatelessWidget {

  final String image_location;
  final String image_caption;

  Category({
       this.image_location,
       this.image_caption
  });

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap:(){},
        child:Container(//must have this container for the horizontal list to display 
          width:100.0,
          height:50,
        child:ListTile(
          title:Image.asset(image_location,
          height: 80.0,
          width: 80.0,),
          subtitle:Container(
            alignment: Alignment.topCenter,
            child: Text(image_caption, ),
          )

       )
      ),
      ),
    );
  }
}