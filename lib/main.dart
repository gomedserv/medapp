import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFD2F1E4),
        title: Row(
          children: [
            // Square Logo
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset('assets/logo.png',
                  fit: BoxFit.cover), // Add your logo image here
            ),
            Spacer(),
            // Alarm Icon Button
            IconButton(
              icon: Icon(Icons.notifications, color: Colors.black),
              onPressed: () {
                // Handle alarm button press
              },
            ),
            // Menu Button
            IconButton(
              icon: Icon(Icons.menu, color: Colors.black),
              onPressed: () {
                // Handle menu button press
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status: Active
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Status: ', style: TextStyle(color: Colors.black)),
                Text('Active', style: TextStyle(color: Color(0xFFD2F1E4))),
              ],
            ),
            SizedBox(height: 16),

            // Four square buttons horizontally
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSquareButton('Button 1'),
                _buildSquareButton('Button 2'),
                _buildSquareButton('Button 3'),
                _buildSquareButton('Button 4'),
              ],
            ),
            SizedBox(height: 16),

            // Search bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 16),

            // Key Metrics
            Text(
              'Key Metrics',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),

            // Card for metrics
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Metrics content goes here...'),
              ),
            ),
            SizedBox(height: 16),

            // Alerts and Notifications with "View All" button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Alerts and Notifications',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    // Handle view all button press
                  },
                  child: Text('View All'),
                ),
              ],
            ),
            SizedBox(height: 8),

            // Card for alerts and notifications
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Alerts and notifications content goes here...'),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), label: 'Business'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'School'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }

  Widget _buildSquareButton(String title) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
