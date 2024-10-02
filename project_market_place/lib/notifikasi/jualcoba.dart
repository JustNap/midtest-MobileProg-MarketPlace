// import 'package:flutter/material.dart';

// import 'notifikasi_success.dart';

// class PaymentScreen extends StatefulWidget {
//   @override
//   _PaymentScreenState createState() => _PaymentScreenState();
// }

// class _PaymentScreenState extends State<PaymentScreen> {
//   bool _isPaymentProcessing = false;

//   void _processPayment() {
//     setState(() {
//       _isPaymentProcessing = true;
//     });

//     Future.delayed(Duration(seconds: 3), () {
//       setState(() {
//         _isPaymentProcessing = false;
//       });
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => NotifikasiSuccess()),
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Halaman Pembayaran'),
//       ),
//       body: Center(
//         child: _isPaymentProcessing
//             ? CircularProgressIndicator()
//             : ElevatedButton(
//                 onPressed: () {
//                   _processPayment();
//                 },
//                 child: Text('Bayar'),
//               ),
//       ),
//     );
//   }
// }
