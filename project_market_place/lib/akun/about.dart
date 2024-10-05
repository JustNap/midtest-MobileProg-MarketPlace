import 'package:flutter/material.dart';


class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Tentang', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24),
              Text(
                'Apa itu E-commerce',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 24),
              Text(
                'Siapa kami?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'Lorem ipsum dolor sit amet. Et praesentium maiores est assumenda veritatis ut necessitatibus cupiditate ad autem eligendi? Aut eius ullam eum galisum tempore ut voluptatem placeat? Eos atque praesentium est perferendis maxime id optio galisum aut earum eligendi qui quae error non nemo repudiandae non vero ducimus. Sed voluptatem quas aut quaerat delectus in consequatur quae et dolor iste et sequi facere et aliquam corporis 33 odit dolorem.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 24),
              Text(
                'Layanan Kami',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}