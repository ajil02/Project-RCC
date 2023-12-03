import 'package:flutter/material.dart';
import 'package:project/pages/admin_home.dart';
import 'package:project/pages/view_orders.dart';

class Admin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to the Add Items page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdminHome()),
                );
              },
              child: Text('Add Items'),
              style: ElevatedButton.styleFrom(
                padding:
                    EdgeInsets.symmetric(vertical: 20), // Adjust the height
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigate to the View Orders page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewOrders()),
                );
              },
              child: Text('View Orders'),
              style: ElevatedButton.styleFrom(
                padding:
                    EdgeInsets.symmetric(vertical: 20), // Adjust the height
              ),
            ),
          ],
        ),
      ),
    );
  }
}
