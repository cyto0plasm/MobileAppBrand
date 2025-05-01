import 'package:flutter/material.dart';
import 'brands_screen.dart'; // Car brand selection
import 'research_screen.dart'; // Research screen
import 'dashboard_screen.dart'; // Dashboard screen

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Marketplace',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Car Marketplace'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 1. Buy a Car Button - Full navigation flow
              _buildNavigationButton(
                context,
                'Buy a Car',
                const BrandsScreen(),
                icon: Icons.car_rental,
                color: Colors.blue,
              ),
              const SizedBox(height: 20),
              
              // 2. Research Button
              _buildNavigationButton(
                context,
                'Research',
                const ResearchScreen(),
                icon: Icons.search,
                color: Colors.green,
              ),
              const SizedBox(height: 20),
              
              // 3. Dashboard Button
              _buildNavigationButton(
                context,
                'Dashboard',
                const DashboardScreen(),
                icon: Icons.dashboard,
                color: Colors.orange,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationButton(
    BuildContext context,
    String text,
    Widget screen, {
    required IconData icon,
    required Color color,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        icon: Icon(icon, size: 24),
        label: Text(text, style: const TextStyle(fontSize: 18)),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}