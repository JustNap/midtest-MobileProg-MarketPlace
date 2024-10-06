import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

class ProfilPage extends StatefulWidget {
  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  String username = 'Kelompok1';
  String email = 'kel1@example.com';
  String phoneNumber = '08123456789';
  String birthDate = '01/01/2000';
  String gender = 'Laki-laki';
  String profileImage = 'assets/Gambar/putih.jpg'; 
  
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  String selectedGender = 'Laki-laki';

  @override
  void initState() {
    super.initState();
    nameController.text = username;
    emailController.text = email;
    phoneController.text = phoneNumber;
    birthDateController.text = birthDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profil'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(profileImage),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          profileImage = 'assets/Gambar/untar.png'; 
                        });
                      },
                      child: Text('Edit Foto', style: TextStyle(color: Colors.teal)),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Nama',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: phoneController,
                decoration: InputDecoration(
                  labelText: 'No. Telp',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 20),
              TextField(
                controller: birthDateController,
                decoration: InputDecoration(
                  labelText: 'Tanggal Lahir',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.datetime,
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: selectedGender,
                decoration: InputDecoration(
                  labelText: 'Jenis Kelamin',
                  border: OutlineInputBorder(),
                ),
                items: ['Laki-laki', 'Perempuan'].map((String gender) {
                  return DropdownMenuItem<String>(
                    value: gender,
                    child: Text(gender),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedGender = newValue!;
                  });
                },
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      username = nameController.text;
                      email = emailController.text;
                      phoneNumber = phoneController.text;
                      birthDate = birthDateController.text;
                      gender = selectedGender;
                    });
                    _simpanpopup(context);
                  },
                  child: Text('Simpan Perubahan',
                  style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _simpanpopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Berhasil'),
          content: Text('Data berhasil disimpan.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
