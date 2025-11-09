import 'package:flutter/material.dart';
import '../models/parent.dart';

class InfoCard extends StatelessWidget {
  final Parent parent;
  const InfoCard({super.key, required this.parent});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(16),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Parent Name: ${parent.name}', style: const TextStyle(fontSize: 16)),
              Text('Child Name: ${parent.childName}', style: const TextStyle(fontSize: 16)),
              Text('Vehicle Number: ${parent.vehicleNumber}', style: const TextStyle(fontSize: 16)),
              Text('Last Pickup: ${parent.lastPickup}', style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
