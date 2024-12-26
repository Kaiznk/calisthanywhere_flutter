import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calistenico/src/theme/theme.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    ThemeProvider appTheme = Provider.of<ThemeProvider>(context);
    bool isDarkMode = appTheme.getTheme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Container(
        padding: EdgeInsets.all(7.0),
        child: ListView(
          children: <Widget>[
            SwitchListTile(
              value: isDarkMode,
              title: Text('Dark Mode'),
              onChanged: (value) {
                appTheme.swapTheme();
              },
            ),
            Divider(),
            _informationW(),
          ],
        ),
      ),
    );
  }

  Widget _informationW() {
    return ListTile(
      title: Text('Information'),
      leading: Icon(Icons.info_outline),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: () {
        Navigator.pushNamed(context, 'information');
      },
    );
  }
}
