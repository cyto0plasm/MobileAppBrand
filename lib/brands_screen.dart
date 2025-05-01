import 'package:flutter/material.dart';
import 'models_screen.dart';

class BrandsScreen extends StatelessWidget {
  const BrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Brand')),
      body: ListView(
        children: [
          _buildBrandSection('Aqua', [
            'Alfa Romeo', 'AM General', 'Aston Martin',
            'Audi', 'Bentley', 'BMW', 'Bugatti', 'Buick', 'Cadillac'
          ], context),
        ],
      ),
    );
  }

  Widget _buildBrandSection(String title, List<String> brands, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Column(
            children: brands.map((brand) => ListTile(
              title: Text(brand),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ModelsScreen(brand: brand),
                ),
              ),
            )).toList(),
          ),
        ],
      ),
    );
  }
}