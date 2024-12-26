import 'package:flutter/material.dart';

class EjerciciosNavigPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.all(10.0),
          children: <Widget>[
            _cargarCards('floor', context),
            SizedBox(height: 30.0),
            _cargarCards('parallel bars', context),
            SizedBox(height: 30.0),
            _cargarCards('bar', context),
          ],
        ),
      ),
    );
  }

  Widget _cargarCards(String lugar, BuildContext context) {
    final card = Container(
      child: Column(
        children: <Widget>[
          Image(
              height: 300.0,
              fit: BoxFit.cover,
              width: double.infinity,
              image: AssetImage('assets/images/$lugar.jpg')),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('$lugar'.characters.first.toUpperCase() +
                '$lugar'.characters.skip(1).toString()),
          )
        ],
      ),
    );
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '$lugar');
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: Theme.of(context).primaryColor,
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                  offset: Offset(2.0, 10.0))
            ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: card,
        ),
      ),
    );
  }
}
