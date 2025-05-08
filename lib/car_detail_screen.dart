import 'package:collage/CarSearchScreen.dart';
import 'package:flutter/material.dart';
import 'car_detail_screen.dart';

class CarSearchScreen extends StatefulWidget {
  const CarSearchScreen({Key? key}) : super(key: key);

  @override
  State<CarSearchScreen> createState() => _CarSearchScreenState();
}

class _CarSearchScreenState extends State<CarSearchScreen> {
  final Map<String, Map<String, String>> carModels = {
    'Alfa Romeo Giulia': {
      'brand': '',
      'model': 'Giulia',
      'image': '../assets/mustang.jpg',
      'price': '45.480 €',
      'description': 'Giulia Veloce 2.0l AT8 280PS "Leder"LED"Navi',
      'specs': '8,0 l/100 km kombiniert · 182 g/km CO₂-Emissionen',
    },
    'Audi A4': {
      'brand': 'Audi',
      'model': 'A4',
      'image': '../assets/a4.jpg',
      'price': '42.000 €',
      'description': 'Audi A4 2.0 TFSI 190PS S tronic LED Navi',
      'specs': '6,5 l/100 km kombiniert · 150 g/km CO₂',
    },
    // You can add more cars here the same way
  };

  String query = '';

  @override
  Widget build(BuildContext context) {
    final filteredCars = carModels.keys
        .where((car) => car.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: const Color(0xFF4A90E2),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'Find a Great Deal',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Search by Car Name', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  TextField(
                    decoration: const InputDecoration(
                      hintText: 'Search...',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        query = value;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      itemCount: filteredCars.length,
                      itemBuilder: (context, index) {
                        final carName = filteredCars[index];
                        final car = carModels[carName]!;
                        return ListTile(
                          title: Text(carName),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CarDetailScreen(
                                  brand: car['brand']!,
                                  model: car['model']!,
                                  imageUrl: car['image']!,
                                  price: car['price']!,
                                  description: car['description']!,
                                  specs: car['specs']!,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.directions_car), label: 'Buy a Car'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Research'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
        ],
      ),
    );
  }
}
