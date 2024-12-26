import 'package:flutter/material.dart';

class InformationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Information'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Image.asset(
              'assets/images/splash_backlever.png',
              width: 241.0,
              height: 189.0,
            ),
            SizedBox(height: 10.0),
            Center(
              child: Text(
                'CalisthAnyWhere',
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8.0),
            Center(
              child: Text(
                'The first rule is to believe in yourself',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 16.0,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            _buildParagraph(
              'CalisthAnyWhere has the mission of promoting the practice of Calisthenics as an excellent way to develop and strengthen the body without the need for any equipment, which allows its practice at any time and place.',
            ),
            _buildParagraph(
              'With the guidance of this application, you can develop your muscles to the same level as you would with any other discipline and also be able to perform movements described by some as impossible.',
            ),
            _buildParagraph(
                'We want to express our gratitude to the global calisthenics community, whose collective knowledge and dedication have inspired countless athletes. This app is a product of that shared passion, designed to help everyone push their limits and achieve their fitness goals.'),
            SizedBox(height: 20.0),
            ListTile(
              leading: Icon(Icons.privacy_tip_outlined),
              title: Text('Privacy Policy'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.pushNamed(context, 'privacyp');
              },
            ),
            SizedBox(height: 20.0),
            Divider(),
            Center(
              child: Column(
                children: [
                  Text(
                    'Version: 0.4',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    'Copyright©2024 Kaiznk, Inc. All rights reserved.',
                    style: TextStyle(fontSize: 13.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildParagraph(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 15.0, height: 1.5),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
