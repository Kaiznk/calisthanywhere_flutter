import 'package:calistenico/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  ThemeProvider? appTheme;
  @override
  Widget build(BuildContext context) {
    appTheme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Container(
          padding: EdgeInsets.all(7.0),
          child: ListView(
            children: <Widget>[
              SwitchListTile(
                  value: rValor(),
                  title: Text('Dark Mode'),
                  onChanged: (value) => appTheme!.swapTheme()),
              Divider(),
              _informationW(),
            ],
          )),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  Widget _informationW() {
    return ListTile(
      title: Text('Information'),
      leading: Icon(
        Icons.info_outline,
      ),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: () {
        Navigator.pushNamed(context, 'information');
      },
    );
  }

  bool rValor() {
    if (appTheme!.getTheme != null && appTheme!.getTheme == ThemeData.dark()) {
      return true;
    } else {
      return false;
    }
  }
}
