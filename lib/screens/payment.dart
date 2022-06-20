import 'package:flutter/material.dart';
import 'package:mental_health_application/utilities/constants.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  double price = 200;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
        backgroundColor: Color(0xFFB2B9E2),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              "$price EGP",
              style: TextStyle(
                fontSize: 50,
                color: Colors.green,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 15, right: 180),
            child: TextField(
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
                border: OutlineInputBorder(),
                hintText: 'Card number',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 15, right: 270),
            child: TextField(
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
                border: OutlineInputBorder(),
                hintText: 'Expiry date',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 15, right: 300),
            child: TextField(
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
                border: OutlineInputBorder(),
                hintText: 'CVV',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              color: orangeColor,
              child: Text("Confirm Payment"),
            ),
          ),
        ],
      ),
    );
  }
}
