// research_screen.dart
import 'package:flutter/material.dart';

class ResearchScreen extends StatelessWidget {
  const ResearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Research')),
      body: const Center(child: Text('Compare cars, read reviews')),
    );
  }
}

