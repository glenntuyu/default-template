import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> features = [
    {'icon': Icons.camera_alt, 'label': 'Camera/Take Photo'},
    {'icon': Icons.qr_code_scanner, 'label': 'Scan QR'},
    // Add more features here
  ];

  void _onFeatureTap(BuildContext context, String label) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Clicked: $label')),
    );
    // Navigate or handle feature tap here
  }

  void _onSyncTap(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Sync In/Out clicked')),
    );
    // Handle sync logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.sync),
            onPressed: () => _onSyncTap(context),
            tooltip: 'Sync In/Out',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: features.map((feature) {
            return GestureDetector(
              onTap: () => _onFeatureTap(context, feature['label']),
              child: Card(
                elevation: 4,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(feature['icon'], size: 48, color: Colors.blue),
                      SizedBox(height: 12),
                      Text(feature['label'], textAlign: TextAlign.center),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}