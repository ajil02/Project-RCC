import 'package:flutter/material.dart';
import 'package:project/pages/admin.dart';
import 'package:project/pages/student_home.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Handle admin login
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Admin(),
                  ),
                );
              },
              child: Text('Admin Login'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle student login
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StudentHome(),
                  ),
                );
              },
              child: Text('Student Login'),
            ),
          ],
        ),
      ),
    );
  }
}
