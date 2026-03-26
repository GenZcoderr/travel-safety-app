import 'package:flutter/material.dart';

void main() {
  runApp(SafeTravelApp());
}

class SafeTravelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SafeTravel AI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: MainScreen(),
    );
  }
}

// MAIN SCREEN WITH NAVIGATION
class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  final List<Widget> screens = [
    HomeScreen(),
    MapScreen(),
    SosScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.black,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: "Map"),
          BottomNavigationBarItem(icon: Icon(Icons.warning), label: "SOS"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

// HOME SCREEN
class HomeScreen extends StatelessWidget {
  int getSafetyScore() {
    int score = 60;
    if (DateTime.now().hour > 20) score -= 20;
    return score;
  }

  @override
  Widget build(BuildContext context) {
    int score = getSafetyScore();

    return Scaffold(
      appBar: AppBar(title: Text("SafeTravel AI")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.security, size: 80, color: Colors.green),
            SizedBox(height: 20),
            Text(
              "Safety Score",
              style: TextStyle(fontSize: 22),
            ),
            Text(
              "$score",
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              score > 50 ? "Safe Area" : "Risky Area",
              style: TextStyle(
                fontSize: 18,
                color: score > 50 ? Colors.green : Colors.red,
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {},
              child: Text("Check Route"),
            )
          ],
        ),
      ),
    );
  }
}

// MAP SCREEN (DUMMY)
class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Map")),
      body: Center(
        child: Text(
          "Map Feature Coming Soon",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

// SOS SCREEN
class SosScreen extends StatelessWidget {
  void triggerSOS(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("🚨 Emergency Alert Sent!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SOS")),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          ),
          onPressed: () => triggerSOS(context),
          child: Text("🚨 SEND SOS", style: TextStyle(fontSize: 18)),
        ),
      ),
    );
  }
}

// PROFILE SCREEN
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Icon(Icons.person, size: 80),
            SizedBox(height: 20),
            Text("User Name", style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text("Emergency Contact: 1234567890"),
            SizedBox(height: 20),
            SwitchListTile(
              title: Text("Enable Alerts"),
              value: true,
              onChanged: (val) {},
            )
          ],
        ),
      ),
    );
  }
}
