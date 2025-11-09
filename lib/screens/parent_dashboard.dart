import 'package:flutter/material.dart';
import 'package:smart_pickup_system/widgets/info_card.dart';
import '../models/parent.dart';

class ParentDashboard extends StatefulWidget {
  final String parentId;
  const ParentDashboard({super.key, required this.parentId});

  @override
  State<ParentDashboard> createState() => _ParentDashboardState();
}

class _ParentDashboardState extends State<ParentDashboard> {
  late Future<Parent> parentData;

  // API SERVICE NEEDED TO FETCH DATA
  @override
  void initState() {
    super.initState();
    parentData = fetchParentData(widget.parentId);
  }

  Future<Parent> fetchParentData(String parentId) async {
    // For now you can return dummy data instead of calling API
    await Future.delayed(const Duration(seconds: 1)); // simulate loading
    return Parent(
      name: "John Doe",
      childName: "Emma Doe",
      vehicleNumber: "AB12CD3456",
      lastPickup: "yesterday(just an example)",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parent Dashboard'),
      ),
      body: FutureBuilder<Parent>(
        future: parentData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final parent = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  InfoCard(parent: parent),
                  const SizedBox(height: 20),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Notifications',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Expanded(
                            child: Center(child: Text('No new notifications')),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: Text('No data found'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          // Navigate to EditProfile screen
        },
        tooltip: "Edit Details",
        child: const Icon(Icons.edit),
      ),
    );
  }
}


