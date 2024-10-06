import 'package:flutter/material.dart';

class NotifikasiPage extends StatelessWidget {
  final List<String> notifications;

  NotifikasiPage({Key? key, required this.notifications}) : super(key: key);

  @override
  Widget _buildEmptyState(BuildContext context) {
    return Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.notifications_off,
            color: Colors.teal.shade400,
            size: 100,
          ),
          SizedBox(height: 16),
          Text(
            'Anda belum memiliki notifikasi',
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
              fontSize: 16,
              color: Colors.teal.shade500,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget _buildNotificationList(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        return _buildNotificationCard(context, notifications[index]);
      },
    );
  }

  Widget _buildNotificationCard(BuildContext context, String notification) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      shadowColor: Colors.grey.withOpacity(0.3),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: Colors.teal.shade100,
          child: Icon(
            Icons.notifications_active,
            color: Colors.teal,
            size: 30,
          ),
        ),
        title: Text(
          notification,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        subtitle: Text(
          'Pesan terbaru',
          style: TextStyle(
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Colors.grey.shade600,
        ),
        onTap: () {
        },
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifikasi',
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          )
        ),
        backgroundColor: Colors.teal,
        elevation: 2,
      ),
      body: notifications.isEmpty
      ? _buildEmptyState(context)
      : _buildNotificationList(context),
    );
  }
}
