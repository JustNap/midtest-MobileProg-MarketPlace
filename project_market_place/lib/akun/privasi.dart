import 'package:flutter/material.dart';

class PrivacyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
        title: Text('Kebijakan Privasi', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchBar(),
              SizedBox(height: 20),
              NotificationCard(),
              SizedBox(height: 20),
              PrivacyInfoCard(),
              SizedBox(height: 20),
              ContactInfoCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Cari',
          prefixIcon: Icon(Icons.search),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pemberitahuan Penting',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Lorem ipsum dolor sit amet. Est laudantium repellendus aut architecto ratione ea recusandae eligendi hic illo assumenda et officia consequatur eum omnis pariatur. Et enim aperiam qui nulla iure et ducimus vero? Est ullam laboriosam sed debitis dolore et iure asperiores est fugiat incidunt sit internos tempore ea facilis tempora et labore mollitia. Aut modi maiores sit voluptate labore et voluptatem explicabo aut facilis veritatis id quisquam totam. In corrupti ullam hic ipsam reprehenderit sit dolor quod ut aliquam inventore est possimus quam et sapiente voluptatum. Et vero similique et velit accusamus est Quis nisi et temporibus repellendus qui enim accusamus et voluptatem consectetur. Id natus repellat ad rerum incidunt qui asperiores rerum a iure rerum et dolores quia id magni dignissimos aut quos omnis.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class PrivacyInfoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0), 
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Kebijakan Privasi',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87, 
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Lorem ipsum dolor sit amet. Aut quisquam neque a molestiae iure et dolores galisum. Qui asperiores rerum id asperiores odio qui omnis neque. Vel eius nesciunt et distinctio quisquam non quis dolor aut quas alias a rerum consequatur. Qui voluptatem labore rem eius natus eos odit aspernatur est mollitia nesciunt. Ab obcaecati consequatur et commodi inventore aut possimus molestiae ut saepe adipisci qui voluptatem excepturi sit rerum architecto qui quis nemo! Aut expedita eligendi eum commodi possimus ut praesentium aperiam quo dolorem deleniti. Et distinctio dignissimos qui nisi quia in blanditiis nihil et neque dolor ut neque quisquam et exercitationem rerum. Qui minus ducimus et internos fugiat hic ullam molestiae hic eveniet tempora eos illo doloribus eum reiciendis galisum. Qui natus ullam et voluptatem amet est beatae consequatur non commodi quia et quaerat culpa. Qui reiciendis velit qui corporis numquam sed omnis delectus.',
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
          SizedBox(height: 10),
          Text(
            'Lorem ipsum dolor sit amet. Sed minima molestias aut ipsam aliquid ex omnis unde a obcaecati repudiandae. Ut rerum mollitia cum iure distinctio et iusto libero ut quasi commodi ut excepturi dolores. Ut accusamus enim aut rerum similique qui labore commodi non dolor debitis. Ex dicta rerum est sunt quia et rerum neque qui consectetur quidem et repudiandae maxime. Vel eaque doloremque qui totam eius ad maxime veritatis. Et iste praesentium ut dicta ratione aut necessitatibus fugiat id dolorem molestiae? Cum soluta doloremque ut maxime explicabo ut perspiciatis voluptatum eum quos voluptates. Et quos tempora et temporibus ipsum et voluptas recusandae ut nostrum voluptas in blanditiis eveniet id voluptas dolores. Ex perspiciatis nostrum qui odio dolorum est alias voluptatibus et similique nihil et cumque corporis sed velit similique.',
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}

class ContactInfoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hubungi Kami',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Apabila Anda mengalami kendala, silakan hubungi kami melalui:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('kelompok1@untar.ac.id'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Call Center: 123456789'),
            ),
          ],
        ),
      ),
    );
  }
}