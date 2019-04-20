import 'package:flutter/material.dart';
import 'package:app_infoware/Pages/Home.dart' as H;

// ignore: must_be_immutable
class Home extends StatefulWidget {

  String _title;

  Home(this._title);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  static TextStyle _textStyle;
  //Se definen los elementos del NavigationBar
  List<BottomNavigationBarItem> _bnItems=[
    new BottomNavigationBarItem(
      title: Text("Home"),
        icon: Icon(Icons.home,color: Colors.black,),
        activeIcon: Icon(Icons.home,color: Colors.black54,)
    ),
    new BottomNavigationBarItem(
        title: Text("Schedule"),
        icon: Icon(Icons.schedule,color: Colors.black,),
        activeIcon: Icon(Icons.schedule,color: Colors.black54,)
    ),
    new BottomNavigationBarItem(
        title: Text("Notifications"),
        icon: Icon(Icons.notifications,color: Colors.black,),
        activeIcon: Icon(Icons.notifications,color: Colors.black54,)
    ),
  ];

  int _currentIndex;

  Widget getPage(){
    switch(_currentIndex){
      case 0: return H.Home(listItem: new Card(),);
    }
    return new Container(
      alignment: Alignment.center,
      child: CircularProgressIndicator(),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentIndex=0;
  }

  @override
  Widget build(BuildContext context) {

    _textStyle=AppBarTheme.of(context).textTheme.caption;

    return Scaffold(
      appBar: AppBar(
        title:Text(widget._title,style: _textStyle),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items:this._bnItems,
        currentIndex: _currentIndex,
        fixedColor: Colors.black54,
        onTap: (index){
          setState(() {
            _currentIndex=index;
          });
        },
      ),
      drawer: Drawer(
        elevation: 2.0,
        child:Column(//Se utiliza column para poder usar Expanded
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: Text("Usuario de prueba"),
              accountEmail: Text("correodeprueba@cesoc.edu.pe"),
              currentAccountPicture: new CircleAvatar(
                backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShexODCmXpx6pl0ilTVouIzAFJG0PKcBiWjVuzmg79C4bY3oZ_"),
              ),
              decoration: BoxDecoration(
                  color: Colors.black
              ),
            ),
            new Expanded(//Se utiliza Expanded para que el ListView ocupe el resto del widget
              child: ListView(
                children: <Widget>[
                  new ListTile(leading: Icon(Icons.map),title: Text("Mapa PUCP",style: _textStyle,),),
                  new ListTile(leading: Icon(Icons.business),title: Text("Patrocinadores",style: _textStyle,),),
                ],
              ),
            ),
            new Container(//Se ubica el ListTile en la parte inferior
              child: Align(
                alignment:FractionalOffset.bottomCenter,
                child: Column(
                  children: <Widget>[
                    new Divider(color: Colors.black12),
                    new ListTile(leading: Icon(Icons.people),title: Text("Sobre Nosotros",style: _textStyle,),),
                  ],
                )
              ),
            )
          ],
        )
      ),
      body: getPage(),
    );
  }
}
