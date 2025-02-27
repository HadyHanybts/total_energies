// import 'package:flutter/material.dart';
// import 'package:total_energies/models/stations_model.dart';
// import 'package:total_energies/services/station_service.dart';
// import 'package:total_energies/widgets/components/card.dart';

// class StationScreen extends StatefulWidget {
//   const StationScreen({super.key});

//   @override
//   _StationScreenState createState() => _StationScreenState();
// }

// class _StationScreenState extends State<StationScreen> {
//   // late Future<List<StationModel>> _stationsFuture;
//   late Future<List<StationModel>> _onlystationsFuture;

//   @override
//   void initState() {
//     super.initState();
//     // _stationsFuture = StationService().getStations();
//     _onlystationsFuture = StationService().getOnlyStations();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Stations")),
//       body: FutureBuilder<List<StationModel>>(
//         // future: _stationsFuture,
//         future: _onlystationsFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text("Error: ${snapshot.error}"));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(child: Text("No stations found"));
//           }

//           final stations = snapshot.data!;
//           return ListView.builder(
//             itemCount: stations.length,
//             itemBuilder: (context, index) {
//               final station = stations[index];
//               return CustomCard(
//                 imageAsset:
//                     "assets/images/logo.png", // Replace with actual image URL if available
//                 title: station.stationName,
//                 description: station.stationAdress ?? "No address available",
//                 icon: Icons.location_on,
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// Without filter Search
// import 'package:flutter/material.dart';
// import 'package:total_energies/models/stations_model.dart';
// import 'package:total_energies/screens/station_details_screen.dart';
// import 'package:total_energies/services/station_service.dart';

// class StationListScreen extends StatefulWidget {
//   const StationListScreen({super.key});

//   @override
//   State<StationListScreen> createState() => _StationListScreenState();
// }

// class _StationListScreenState extends State<StationListScreen> {
//   final StationService _stationService = StationService();
//   late Future<List<StationModel>> _stationsFuture;

//   @override
//   void initState() {
//     super.initState();
//     _stationsFuture = _stationService.getOnlyStations();
//   }

//   void _navigateToDetails(BuildContext context, StationModel station) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => StationDetailsScreen(station: station),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Stations"),
//         centerTitle: true,
//       ),
//       body: FutureBuilder<List<StationModel>>(
//         future: _stationsFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text("Failed to load stations"));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(child: Text("No stations available"));
//           }

//           final stations = snapshot.data!;
//           return ListView.builder(
//             padding: EdgeInsets.all(10),
//             itemCount: stations.length,
//             itemBuilder: (context, index) {
//               final station = stations[index];
//               return GestureDetector(
//                 onTap: () => _navigateToDetails(context, station),
//                 child: Card(
//                   elevation: 5,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: ListTile(
//                     leading: Icon(Icons.location_on, color: Colors.blue),
//                     title: Text(station.stationName),
//                     subtitle:
//                         Text(station.stationAdress ?? "No address available"),
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// With filter search
// import 'package:flutter/material.dart';
// import 'package:total_energies/core/constant/colors.dart';
// import 'package:total_energies/models/stations_model.dart';
// import 'package:total_energies/screens/station_details_screen.dart';
// import 'package:total_energies/services/station_service.dart';

// class StationListScreen extends StatefulWidget {
//   const StationListScreen({super.key});

//   @override
//   State<StationListScreen> createState() => _StationListScreenState();
// }

// class _StationListScreenState extends State<StationListScreen> {
//   final StationService _stationService = StationService();
//   late Future<List<StationModel>> _stationsFuture;
//   String _searchQuery = "";

//   @override
//   void initState() {
//     super.initState();
//     _stationsFuture = _stationService.getOnlyStations();
//   }

//   void _navigateToDetails(BuildContext context, StationModel station) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => StationDetailsScreen(station: station),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Stations"),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: EdgeInsets.all(10),
//             child: TextField(
//               decoration: InputDecoration(
//                 labelText: "Search Stations",
//                 border: OutlineInputBorder(),
//                 prefixIcon: Icon(Icons.search),
//               ),
//               onChanged: (value) {
//                 setState(() {
//                   _searchQuery = value.toLowerCase();
//                 });
//               },
//             ),
//           ),
//           Expanded(
//             child: FutureBuilder<List<StationModel>>(
//               future: _stationsFuture,
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(child: CircularProgressIndicator());
//                 } else if (snapshot.hasError) {
//                   return Center(child: Text("Failed to load stations"));
//                 } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                   return Center(child: Text("No stations available"));
//                 }

//                 final stations = snapshot.data!
//                     .where((station) => station.stationName
//                         .toLowerCase()
//                         .contains(_searchQuery))
//                     .toList();

//                 return ListView.builder(
//                   padding: EdgeInsets.all(10),
//                   itemCount: stations.length,
//                   itemBuilder: (context, index) {
//                     final station = stations[index];
//                     return GestureDetector(
//                       onTap: () => _navigateToDetails(context, station),
//                       child: Card(
//                         elevation: 5,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: ListTile(
//                           leading: Icon(Icons.location_on, color: primaryColor),
//                           title: Text(station.stationName),
//                           subtitle: Text(
//                               station.stationAdress ?? "No address available"),
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// Station List With Filter and direction
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:total_energies/core/constant/colors.dart';
import 'package:total_energies/models/stations_model.dart';
import 'package:total_energies/screens/station_details_screen.dart';
import 'package:total_energies/services/station_service.dart';

class StationListScreen extends StatefulWidget {
  const StationListScreen({super.key});

  @override
  State<StationListScreen> createState() => _StationListScreenState();
}

class _StationListScreenState extends State<StationListScreen> {
  final StationService _stationService = StationService();
  late Future<List<StationModel>> _stationsFuture;
  String _searchQuery = "";
  String name = "";

  @override
  void initState() {
    super.initState();
    _stationsFuture = _stationService.getOnlyStations();
    loadUserData();
  }

  void _navigateToDetails(BuildContext context, StationModel station) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StationDetailsScreen(station: station),
      ),
    );
  }

  void loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('username') ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isRTL =
        Directionality.of(context) == TextDirection.rtl; // Check direction

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 221, 221),
      appBar: AppBar(
        backgroundColor: secondColors,
        title: Container(
          child: Row(
            children: Directionality.of(context) == TextDirection.rtl
                ? [
                    Text("Hi: $name", style: TextStyle(fontSize: 18)),
                    Spacer(),
                    Container(
                      height: kToolbarHeight, // Matches the AppBar's height
                      child: Image.asset(
                        "assets/images/logo.png",
                        fit: BoxFit
                            .contain, // Makes image cover entire container
                      ),
                    ),
                  ]
                : [
                    Container(
                      height: kToolbarHeight, // Matches the AppBar's height
                      child: Image.asset(
                        "assets/images/logo.png",
                        fit: BoxFit
                            .contain, // Makes image cover entire container
                      ),
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Text("Hi",
                            style: TextStyle(
                                fontSize: 18,
                                color: primaryColor,
                                fontWeight: FontWeight.bold)),
                        Text("$name",
                            style: TextStyle(
                                fontSize: 18,
                                color: primaryColor,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  ],
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Search Stations",
                border: OutlineInputBorder(),
                prefixIcon: isRTL
                    ? null
                    : Icon(Icons.search), // Adjust icon for direction
                suffixIcon:
                    isRTL ? Icon(Icons.search) : null, // Search icon for RTL
              ),
              textAlign: isRTL ? TextAlign.right : TextAlign.left,
              onChanged: (value) {
                setState(() {
                  _searchQuery = value.toLowerCase();
                });
              },
            ),
          ),
          Expanded(
            child: FutureBuilder<List<StationModel>>(
              future: _stationsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("Failed to load stations"));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text("No stations available"));
                }

                final stations = snapshot.data!
                    .where((station) => station.stationName
                        .toLowerCase()
                        .contains(_searchQuery))
                    .toList();

                return ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: stations.length,
                  itemBuilder: (context, index) {
                    final station = stations[index];
                    return GestureDetector(
                      onTap: () => _navigateToDetails(context, station),
                      child: Card(
                        color: Colors.grey,
                        margin: EdgeInsets.only(bottom: 15),
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          leading: isRTL
                              ? null
                              : Icon(Icons.location_on, color: primaryColor),
                          trailing: isRTL
                              ? Icon(Icons.location_on, color: primaryColor)
                              : null,
                          title: Text(
                            isRTL
                                ? station.stationArabicName
                                : station.stationName, // Adjust language
                            textAlign: isRTL ? TextAlign.right : TextAlign.left,
                          ),
                          subtitle: Text(
                            isRTL
                                ? (station.stationAdress ?? "لا يوجد عنوان")
                                : (station.stationAdress ??
                                    "No address available"),
                            textAlign: isRTL ? TextAlign.right : TextAlign.left,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
