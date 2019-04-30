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
        title: Text(events[i].name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.5),),
        speaker: Text("Expositor: "+events[i].speaker.fullname),
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

// ignore: must_be_immutable
class Carousel extends StatelessWidget {

  List<Widget>children;

  Carousel({this.children});

  @override
  Widget build(BuildContext context) {

    Size display=MediaQuery.of(context).size;

    return CarouselSlider(
      enlargeCenterPage: true,
      height: display.width>display.height?display.height*0.72:display.width*0.81,
      items:this.children,
    );
  }
}

class MyCard extends StatelessWidget {

  Text title;
  Text speaker;
  String imageUrl;

  MyCard({this.title,this.speaker,this.imageUrl});

  @override
  Widget build(BuildContext context) {

    Size display=MediaQuery.of(context).size;

    return Container(
      width: display.width,
      margin: EdgeInsets.only(right: 5.0,left: 5.0),
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
        elevation: 2.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Expanded(
              child: new Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    new Expanded(child: Container()),
                    new Container(
                      height: 20.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.white.withOpacity(0.0),Colors.white]
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            new Container(
              child: ListTile(title: title,subtitle: speaker,),
            )
          ],
        )
      ),
    );
  }
}


