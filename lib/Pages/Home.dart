import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatelessWidget {

  List<Widget> getList(){

    List<Widget>items=new List<Widget>();

    for(int i=0;i<5;i++){
      items.add(new MyCard(title: new Text("Prueba "+(i+1).toString()),));
    }

    return items;
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      alignment: Alignment.center,
      child: ListView(
        padding: EdgeInsets.only(top: 20.0,bottom: 20.0),
        children: <Widget>[
          new Text("  Dia 1", style: TextStyle(fontSize: 20.0),),
          new Padding(padding: EdgeInsets.only(bottom: 20.0)),
          new Carousel(children: getList(),),
          new Padding(padding: EdgeInsets.only(bottom: 20.0)),
          new Text("  Dia 2", style: TextStyle(fontSize: 20.0)),
          new Padding(padding: EdgeInsets.only(bottom: 20.0)),
          new Carousel(children: getList(),),
          new Padding(padding: EdgeInsets.only(bottom: 20.0)),
          new Text("  Dia 3", style: TextStyle(fontSize: 20.0)),
          new Padding(padding: EdgeInsets.only(bottom: 20.0)),
          new Carousel(children: getList(),)
        ],
      )
    );
  }
}

class Carousel extends StatelessWidget {

  List<Widget>children;

  Carousel({this.children});

  @override
  Widget build(BuildContext context) {

    Size display=MediaQuery.of(context).size;

    return CarouselSlider(
      enlargeCenterPage: true,
      height: display.width*0.63,
      items:this.children,
    );
  }
}

class MyCard extends StatelessWidget {

  Text title;

  MyCard({this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(right: 5.0,left: 5.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
        elevation: 2.0,
        child: Center(
          child: title,
        ),
      ),
    );
  }
}


