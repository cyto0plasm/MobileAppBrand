import 'package:flutter/material.dart';
import 'car_detail_screen.dart';

class ModelsScreen extends StatelessWidget {
  final String brand;
  
  const ModelsScreen({super.key, required this.brand});

  @override
  Widget build(BuildContext context) {
    // Different models for different brands
    final models = {
      'Alfa Romeo': ['Giulia', 'Stelvio', 'Tonale', 'Discontinued Models', '4C Coupe'],
      'Audi': ['A3', 'A4', 'A6', 'Q5', 'Q7'],
      // Add other brands...
    };

    return Scaffold(
      appBar: AppBar(title: Text('$brand Models')),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: models[brand]!.map((model) => ListTile(
                title: Text(model),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CarDetailScreen(
                      brand: brand,
                      model: model,
                    ),
                  ),
                ),
              )).toList(),
            ),
          ),
        ],
      ),
    );
  }
}