import 'package:flutter/material.dart';

class CarDetailScreen extends StatelessWidget {
  final String brand;
  final String model;
  
  const CarDetailScreen({
    super.key,
    required this.brand,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    // Sample data - in real app you'd fetch this from API/database
    final carDetails = {
      'Giulia': {
        'price': '45.480 €',
        'description': 'Giulia Veloce 2.0l AT8 280PS "Leder"LED"Navi',
        'specs': '8,0 l/100 km Kraftstoffverbrauch kombiniert · 182 g/km CO₂-Emissionen',
        'image': 'assets/giulia.jpg', // Make sure to add this image
      },
      // Add other models...
    };

    return Scaffold(
      appBar: AppBar(title: Text('$brand $model')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/mustang.jpg', height: 200),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('$brand $model', 
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(carDetails[model]!['price']!, 
                    style: const TextStyle(fontSize: 20, color: Colors.blue)),
                  const SizedBox(height: 8),
                  Text(carDetails[model]!['description']!),
                  const SizedBox(height: 16),
                  Text(carDetails[model]!['specs']!, 
                    style: const TextStyle(color: Colors.grey)),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Contact Dealer'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}