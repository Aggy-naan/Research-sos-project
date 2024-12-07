import 'package:flutter/material.dart';
import 'sos_page1.dart'; // Import SOSPage1

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 18.0), // Default text size increased
          bodyMedium: TextStyle(fontSize: 18.0), // Default text size increased
          bodySmall: TextStyle(fontSize: 16.0), // Default text size for smaller text
          labelLarge: TextStyle(fontSize: 18.0), // Increased size for button text
          displayLarge: TextStyle(fontSize: 32.0), // Increased size for headlines
          displayMedium: TextStyle(fontSize: 28.0),
          displaySmall: TextStyle(fontSize: 24.0),
          headlineLarge: TextStyle(fontSize: 22.0),
          headlineMedium: TextStyle(fontSize: 20.0),
          headlineSmall: TextStyle(fontSize: 18.0),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _animation = Tween<double>(begin: 1.0, end: 1.1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _navigateToSOSPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SOSPage1()), // Navigate to SOSPage1
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red, // Changed the AppBar color to red
        leading: PopupMenuButton<String>(
          icon: const Icon(Icons.menu), // Replacing text with a menu icon
          onSelected: (String result) {
            // Handle menu item selection
            if (result == 'Profile') {
              // Perform action for Profile
            } else if (result == 'Settings') {
              // Perform action for Settings
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            const PopupMenuItem<String>(
              value: 'Profile',
              child: Text('Profile'),
            ),
            const PopupMenuItem<String>(
              value: 'Settings',
              child: Text('Settings'),
            ),
          ],
        ),
      ),
      body: Center(
        child: GestureDetector(
          onTapDown: (_) => _controller.forward(),
          onTapUp: (_) {
            _controller.reverse();
            _navigateToSOSPage();
          },
          child: ScaleTransition(
            scale: _animation,
            child: ElevatedButton(
              onPressed: _navigateToSOSPage,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(135), // Increased padding for larger size
              ),
              child: const Text(
                'SOS',
                style: TextStyle(
                  fontSize: 50, // Increased font size for better readability
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
