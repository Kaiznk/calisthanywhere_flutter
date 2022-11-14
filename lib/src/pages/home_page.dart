import 'package:calistenico/src/menu/constant.dart';
import 'package:calistenico/src/pages/initial_pages/consejosNavig_page.dart';
import 'package:calistenico/src/pages/initial_pages/ejerciciosNavig_page.dart';
import 'package:calistenico/src/pages/initial_pages/rutinasNavig_page.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: choiceAction,
            itemBuilder: (BuildContext context) {
              return Constants.choices.map((String choice) {
                return PopupMenuItem<String>(
                  child: Text(choice),
                  value: choice,
                );
              }).toList();
            },
          )
        ],
        title: Text('CalisthAnyWhere'),
      ),
      body: _callPage(currentIndex),
      bottomNavigationBar: _crearBottomNavigationBar(),
    );
  }

  Widget _crearBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/exercise.png')),
            label: 'Exercises'),
        BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/icon_wm.png')),
            label: 'Routines'),
        BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/advice.png')),
            label: 'Tips'),
      ],
    );
  }

  Widget _callPage(int paginaActual) {
    switch (paginaActual) {
      case 0:
        return EjerciciosNavigPage();
      case 1:
        return RutinasNavigPage();
      case 2:
        return ConsejosNavigPage();

      default:
        return RutinasNavigPage();
    }
  }

  void choiceAction(String choice) async {
    if (choice == Constants.Rate_us) {
      const url = 'https://play.google.com/store/apps';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'could not launch $url';
      }
    } else if (choice == Constants.Share) {
      final RenderBox box = context.findRenderObject() as RenderBox;
      Share.share(
        'Train with the dedicated calisthenics app for you: https://play.google.com/store/apps',
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
      );
    } else if (choice == Constants.Setting) {
      Navigator.pushNamed(context, 'settings');
    } else if (choice == Constants.Contact_us) {
      const url = 'https://facebook.com/kaiznk.corp';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'could not launch $url';
      }
    }
  }
}
