import 'package:flutter/material.dart';

class NotifikasiPage extends StatelessWidget {
  final List<Map<String, String>> notifications;

  NotifikasiPage({required this.notifications});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifikasi'),
      ),
      body: notifications.isEmpty
          ? Center(child: Text('Belum ada notifikasi'))
          : ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    title: Text(notification['title']!,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5),
                        Text(notification['description']!),
                        SizedBox(height: 5),
                        Text(
                          notification['date']!,
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                    trailing: ElevatedButton(
                      onPressed: () {
                        // Aksi saat tombol ditekan
                      },
                      child: Text('Tampilkan Rincian'),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
