import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ListView(
        padding: EdgeInsets.only(top: 20.0,bottom: 20.0),
        children: <Widget>[
          new Text("  Dia 1", style: TextStyle(fontSize: 20.0),),
          new Padding(padding: EdgeInsets.only(bottom: 20.0)),
          new Carousel(),
          new Padding(padding: EdgeInsets.only(bottom: 20.0)),
          new Text("  Dia 2", style: TextStyle(fontSize: 20.0)),
          new Padding(padding: EdgeInsets.only(bottom: 20.0)),
          new Carousel(),
          new Padding(padding: EdgeInsets.only(bottom: 20.0)),
          new Text("  Dia 3", style: TextStyle(fontSize: 20.0)),
          new Padding(padding: EdgeInsets.only(bottom: 20.0)),
          new Carousel()
        ],
      )
    );
  }
}

class Carousel extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Size display=MediaQuery.of(context).size;

    return CarouselSlider(
      enlargeCenterPage: true,
      height: display.width*0.63,
      items: [1,2,3,4,5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: display.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              child: new Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                elevation: 4.5,)
            );
          },
        );
      }).toList(),
    );
  }
}

