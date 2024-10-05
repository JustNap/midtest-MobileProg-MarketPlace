import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Upload Produk',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UploadProductScreen(),
    );
  }
}

class UploadProductScreen extends StatefulWidget {
  @override
  _UploadProductScreenState createState() => _UploadProductScreenState();
}

class _UploadProductScreenState extends State<UploadProductScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();
  XFile? _image;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = pickedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Produk'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Nama Produk',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Harap masukkan nama produk';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _priceController,
                  decoration: InputDecoration(
                    labelText: 'Harga Produk',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Harap masukkan harga produk';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    labelText: 'Deskripsi Produk',
                  ),
                  maxLines: 2,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Harap masukkan deskripsi produk';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                Row(
                  children: <Widget>[
                    _image != null
                        ? Image.file(
                            File(_image!.path),
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          )
                        : Placeholder(
                            fallbackWidth: 200,
                            fallbackHeight: 200,
                          ),
                    SizedBox(width: 16.0),
                    ElevatedButton(
                      onPressed: _pickImage,
                      child: Text('Pilih Gambar'),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      // Implement upload logic here
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Produk berhasil diupload')),
                      );
                    }
                  },
                  child: Text(
                    'Upload Produk',
                    style: TextStyle(color: Colors.green),
                ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
