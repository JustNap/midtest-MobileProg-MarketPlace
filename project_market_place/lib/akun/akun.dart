import 'package:flutter/material.dart';
import '../pembelian/checkout.dart';
import 'profil.dart';
import 'setting.dart';
import '../bottom_nav.dart';

class AkunPage extends StatefulWidget {
  @override
  _AkunPageState createState() => _AkunPageState();
}

class _AkunPageState extends State<AkunPage> {
  String greeting = 'Hello';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('akun',
          style: TextStyle(
            fontFamily: 'poppins_semibold'
          ),
        ),
        backgroundColor: Colors.teal,
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.teal,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.teal),
              title: Text('Pengaturan',
                  style: TextStyle(
                    fontFamily: 'poppins_semibold'
                  )
                ),
              subtitle: Text('Notifikasi & Kata Sandi'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingPage()),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.smartphone, color: Colors.teal),
              title: Text('Alasan pilih kami',
                  style: TextStyle(
                    fontFamily: 'poppins_semibold'
                  )
                ),
              subtitle: Text('kenali kami'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.policy, color: Colors.teal),
              title: Text('Kebijakan privasi',
                  style: TextStyle(
                    fontFamily: 'poppins_semibold'
                  )
                ),
              subtitle: Text('Pelajari selengkapnya'),
            ),
            Divider(),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'Hubungi kami:',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              'kelompok1@untar.ac.id',
              style: TextStyle(color: Colors.teal),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/Gambar/putih.jpg',
                fit: BoxFit.cover, width: double.infinity, height: 180),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListTile(
                leading: CircleAvatar(
                  child: Text('1'),
                  backgroundColor: Colors.blue,
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      greeting,
                      style: TextStyle(
                        fontFamily: 'poppins_semibold',
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProfilPage()),
                        );
                        setState(() {
                          greeting = 'Welcome back';
                        });
                      },
                      child: Text('Edit profile'),
                    ),
                  ],
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Status',
                  style: TextStyle(
                    fontFamily: 'poppins_semibold', 
                    fontSize: 18
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.sell, color: Colors.teal),
              title: Text('Lanjut jual'),
              subtitle: Text('Dapatkan estimasi harga Handphone'),
              trailing: Icon(Icons.chevron_right),
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart, color: Colors.teal),
              title: Text('Status Pembelian'),
              subtitle: Text('LIhat sudah sampai mana Barang mu'),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CheckoutPage()),
                );
              },
            ),
            Divider(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Start buying now!',
                        style: TextStyle(
                            fontFamily: 'poppins_semibold', 
                            fontSize: 16
                        ),
                      ),
                      SizedBox(height: 8),
                      Text('Seems like you haven\'t explored much yet!'),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Explore Phone'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
