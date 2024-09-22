import 'package:flutter/material.dart';
import 'profil.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool _isDarkMode = false;
  bool _isNotificationsEnabled = true;
  String _selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengaturan'),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [

          ListTile(
            leading: CircleAvatar(
              backgroundImage:
                  AssetImage('assets/Gambar/putih.jpg'),
              radius: 24,
            ),
            title: Text('Kelompok 1'),
            subtitle: Text('kel1@example.com'),
            trailing: Icon(Icons.edit, color: Colors.teal),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilPage()),
              );
            },
          ),
          Divider(),

          SwitchListTile(
            title: Text('Dark Mode'),
            value: _isDarkMode,
            onChanged: (bool value) {
              setState(() {
                _isDarkMode = value;
              });
            },
            secondary: Icon(Icons.dark_mode, color: Colors.teal),
          ),

          SwitchListTile(
            title: Text('Notifikasi'),
            value: _isNotificationsEnabled,
            onChanged: (bool value) {
              setState(() {
                _isNotificationsEnabled = value;
              });
            },
            secondary: Icon(Icons.notifications_active, color: Colors.teal),
          ),

          ListTile(
            leading: Icon(Icons.language, color: Colors.teal),
            title: Text('Language'),
            subtitle: Text(_selectedLanguage),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              _showLanguageDialog();
            },
          ),


          // Logout button
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: ElevatedButton.icon(
              onPressed: () {
                // Perform logout
              },
              icon: Icon(Icons.logout, color: Colors.white),
              label: Text('Logout'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }


  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Language'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text('English'),
                leading: Radio<String>(
                  value: 'English',
                  groupValue: _selectedLanguage,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedLanguage = value!;
                    });
                    Navigator.of(context).pop();
                  },
                ),
              ),
              ListTile(
                title: Text('Bahasa Indonesia'),
                leading: Radio<String>(
                  value: 'Bahasa Indonesia',
                  groupValue: _selectedLanguage,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedLanguage = value!;
                    });
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
