import 'package:flutter/material.dart';

class InformationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Information'),
      ),
      body: Container(
          padding: EdgeInsets.all(6.0),
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            children: <Widget>[
              Image(
                image: AssetImage('assets/images/splash_backlever.png'),
                width: 241.0,
                height: 189.0,
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                'CalisthAnyWhere',
                textAlign: TextAlign.center,
                style:
                    TextStyle(fontSize: 19.0, fontFamily: 'sans-serif-medium'),
              ),
              SizedBox(
                height: 6.0,
              ),
              Text(
                'The first rule is to believe in yourself',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontStyle: FontStyle.italic, fontFamily: 'sans-serif'),
              ),
              SizedBox(
                height: 35.0,
              ),
              Text(
                'CalisthAnyWhere has the mission of promoting the practice of Calisthenics as an excellent way to develop and strengthen the body without the need for any equipment, which allows its practice at any time and place.',
                textAlign: TextAlign.left,
                style: TextStyle(fontFamily: 'sans-serif'),
              ),
              SizedBox(
                height: 7.0,
              ),
              Text(
                'With the guidance of this application you can develop your muscles to the same level as you would with any other discipline and you will also be able to carry out movements described by some people as impossible.',
                textAlign: TextAlign.left,
                style: TextStyle(fontFamily: 'sans-serif'),
              ),
              SizedBox(
                height: 7.0,
              ),
              Text(
                'We want to mention and thank the great groups and teachers of Calisthenics from whom much of our knowledge is nourished. These are: Chris Heria with his Thenx group, Hannibal For King and Frank Medrano for being the founding fathers of this sport, the BarStarzz group with their excellent routines, Yerai Alonso with his guide and many others who have left their mark.',
                textAlign: TextAlign.left,
                style: TextStyle(fontFamily: 'sans-serif'),
              ),
              SizedBox(
                height: 35.0,
              ),
              ListTile(
                leading: Icon(Icons.privacy_tip_outlined),
                title: Text('Privacy Policy'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Navigator.pushNamed(context, 'privacyp');
                },
              ),
              SizedBox(
                height: 28.0,
              ),
              Divider(
                height: 1.0,
              ),
              Text(
                'version: 0.4',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0, fontFamily: 'sans-serif'),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text('Copyright©2022 Kaiznk, Inc. All rights reserved.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13.0, fontFamily: 'sans-serif'))
            ],
          )),
    );
  }
}
