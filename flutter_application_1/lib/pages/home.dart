import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Feeding.dart';
import 'package:flutter_application_1/pages/Tempreture.dart';
import 'package:flutter_application_1/pages/Waterlevel.dart';
import 'package:flutter_application_1/pages/Waterquality.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Tank Home',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Tank'),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/back1.jpg.avif'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(20.0),
              child: const Text(
                'Smart Tank Name',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Options',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: const [
                  CategoryCard(
                    title: 'Temperature',
                    icon: Icons.thermostat,
                    color: Colors.blue,
                    page: Temp(),
                  ),
                  CategoryCard(
                    title: 'Water Level',
                    icon: Icons.opacity,
                    color: Colors.green,
                    page: WaterLevel(waterLevelPercentage: 50.0),
                  ),
                  CategoryCard(
                    title: 'Feeding',
                    icon: Icons.fastfood,
                    color: Colors.orange,
                    page: Feed(),
                  ),
                  CategoryCard(
                    title: 'Water Quality',
                    icon: Icons.filter,
                    color: Colors.purple,
                    page: WaterQuality(),
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

class CategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final page;

  const CategoryCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.color,
    required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => page));
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 50.0,
                color: color,
              ),
              const SizedBox(height: 10.0),
              Text(
                title,
                style: const TextStyle(
                    fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
