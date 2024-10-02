import 'package:flutter/material.dart';

class NotifikasiPage extends StatelessWidget {
  final List<String> notifications;

  NotifikasiPage({Key? key, required this.notifications}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifikasi',
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
      body: notifications.isEmpty
          ? Center(
              child: Text(
                'Belum ada notifikasi',
                style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  elevation: 4,
                  child: ListTile(
                    title: Text(
                      notifications[index],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Navigate to the detail page or show details here
                    },
                  ),
                );
              },
            ),
    );
  }
}
