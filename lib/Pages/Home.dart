import 'package:app_infoware/models/event.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:app_infoware/database/crud.dart';

class Home extends StatelessWidget {

  Future<List<Widget>> getCards() async {

    List<Event> events=await getEvents();

    List<Widget>items=[];

    for(int i=0;i<5;i++){
      items.add(new MyCard(
        imageUrl: events[i].url,
        title: Text(events[i].name,style: TextStyle(color: Colors.white),),
      ));
    }

    return items;
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> cards;

    return FutureBuilder(
        future: getCards(),
        builder: (context,snapshot){
          cards=snapshot.data;
          return cards==null?Center(child:CircularProgressIndicator()):Container(
              alignment: Alignment.center,
              child: ListView(
                padding: EdgeInsets.only(top: 20.0,bottom: 20.0),
                children: <Widget>[
                  new Text("  Dia 1", style: TextStyle(fontSize: 20.0),),
                  new Padding(padding: EdgeInsets.only(bottom: 20.0)),
                  new Carousel(children: cards,),
                  new Padding(padding: EdgeInsets.only(bottom: 20.0)),
                  new Text("  Dia 2", style: TextStyle(fontSize: 20.0)),
                  new Padding(padding: EdgeInsets.only(bottom: 20.0)),
                  new Carousel(children: cards,),
                  new Padding(padding: EdgeInsets.only(bottom: 20.0)),
                  new Text("  Dia 3", style: TextStyle(fontSize: 20.0)),
                  new Padding(padding: EdgeInsets.only(bottom: 20.0)),
                  new Carousel(children: cards,)
                ],
              )
          );
        },
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
  String imageUrl;

  MyCard({this.title,this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(right: 5.0,left: 5.0),
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
        elevation: 2.0,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new Expanded(child: Container()),
              new Container(
                color: Colors.black54,
                padding: EdgeInsets.only(top:20.0,bottom: 20.0,left: 10.0),
                child: title,
              )
            ],
          )
        )
      ),
    );
  }
}


