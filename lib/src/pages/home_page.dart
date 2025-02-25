import 'package:calistenico/src/menu/constant.dart';
import 'package:calistenico/src/pages/initial_pages/ejerciciosNavig_page.dart';
import 'package:calistenico/src/pages/initial_pages/personalTNavig_page.dart';
import 'package:calistenico/src/pages/initial_pages/rutinasNavig_page.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
// import 'package:url_launcher/url_launcher.dart'; // Comentado para desactivar url_launcher

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
            icon: ImageIcon(AssetImage('assets/images/pt_icon.png')),
            label: 'Personal Training'),
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
        return PersonalTrainerPage();

      default:
        return RutinasNavigPage();
    }
  }

  void choiceAction(String choice) async {
    if (choice == Constants.Rate_us) {
      // final Uri url = Uri.parse('https://play.google.com/store/apps/');
      // if (await canLaunchUrl(url)) {
      //   await launchUrl(url, mode: LaunchMode.externalApplication); // Abre con navegador externo
      // } else {
      //   throw 'Could not launch $url';
      // }
    } else if (choice == Constants.Share) {
      final RenderBox box = context.findRenderObject() as RenderBox;
      Share.share(
        'Train with the dedicated calisthenics app for you: https://play.google.com/store/apps',
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
      );
    } else if (choice == Constants.Setting) {
      Navigator.pushNamed(context, 'settings');
    } else if (choice == Constants.Contact_us) {
      // final Uri url = Uri.parse('https://facebook.com/kaiznk.corp');
      // if (await canLaunchUrl(url)) {
      //   await launchUrl(url, mode: LaunchMode.externalApplication);
      // } else {
      //   throw 'Could not launch $url';
      // }
    }
  }
}
