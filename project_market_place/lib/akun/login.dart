import 'package:flutter/material.dart';
import 'register.dart';
import '../bottom_nav.dart';

class LoginPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  final newPassword = TextEditingController();
  final confirmPassword = TextEditingController();
  final forgotPassFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.local_mall,
                  size: 80,
                  color: Colors.white,
                ),
                SizedBox(height: 16),
                Text(
                  'Log in to ...',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 32),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: email,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(color: Colors.black),
                          contentPadding: EdgeInsets.all(16),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(color: Colors.black),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'harap masukan email !!';
                          }
                          return null;
                        },
                      ),
                      Divider(height: 1),
                      TextFormField(
                        controller: password,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.black),
                          contentPadding: EdgeInsets.all(16),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(color: Colors.black),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Harap masukan Password !!';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () => _showForgotPasswordDialog(context),
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  child: Text('Log in'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.teal,
                    backgroundColor: Colors.white,
                    minimumSize: Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BotNavBar()),
                      );
                    }
                  },
                ),
                SizedBox(height: 16),
                Text(
                  'or, create a new account',
                  style: TextStyle(color: Colors.white70),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  child: Text('Sign Up'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.teal,
                    backgroundColor: Colors.white,
                    minimumSize: Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                ),
                SizedBox(height: 32),
                Text(
                  'Log in with',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.facebook, color: Colors.white),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.g_mobiledata, color: Colors.white),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.catching_pokemon, color: Colors.white),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  void _showForgotPasswordDialog(BuildContext context) {


    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Forgot Password'),
          content: Form(
            key: forgotPassFormKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukkan email!';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: newPassword,
                  decoration: InputDecoration(
                    labelText: 'Password Baru',
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukkan password baru!';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: confirmPassword,
                  decoration: InputDecoration(
                    labelText: 'Konfirmasi Password',
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value != newPassword.text) {
                      return 'Password tidak cocok!';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (forgotPassFormKey.currentState!.validate()) {
                  Navigator.of(context).pop(); 
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Password berhasil direset')),
                  );
                }
              },
              child: Text('Reset'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); 
              },
              child: Text('Batal'),
            ),
          ],
        );
      },
    );
  }
}
