import 'package:flutter/material.dart';

class WaterLevel extends StatelessWidget {
  final double waterLevelPercentage;

  const WaterLevel({
    Key? key,
    required this.waterLevelPercentage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Water Level'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 200.0,
                  height: 200.0,
                  child: CircularProgressIndicator(
                    value: waterLevelPercentage / 100,
                    strokeWidth: 10.0,
                    backgroundColor: Colors.grey[300],
                    color:
                        waterLevelPercentage >= 50 ? Colors.green : Colors.red,
                  ),
                ),
                Text(
                  '$waterLevelPercentage%', // Show the percentage inside the circle
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Text(
              'Water Level',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            Container(),
          ],
        ),
      ),
    );
  }
}
