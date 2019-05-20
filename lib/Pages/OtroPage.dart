import 'package:flutter/material.dart';


class OtroPage extends StatelessWidget {
  final String url;

  const OtroPage({Key key, this.url}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: new Hero(
            tag: url,
            child: Image.network(url),
        ),
      ),
    )
    );
  }
}