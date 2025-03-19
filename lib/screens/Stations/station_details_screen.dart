
import 'package:flutter/material.dart';
import 'package:total_energies/models/stations_model.dart';

class StationDetailsScreen extends StatelessWidget {
  final StationModel station;

  const StationDetailsScreen({super.key, required this.station});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(station.stationName)),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Station Code: ${station.stationCode ?? 'N/A'}",
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text("Address: ${station.stationAdress ?? 'N/A'}",
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text("Government: ${station.stationGovernment ?? 'N/A'}",
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text("BT Code: ${station.btCode ?? 'N/A'}",
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text("Active: ${station.activeYN == true ? 'Yes' : 'No'}",
                style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}