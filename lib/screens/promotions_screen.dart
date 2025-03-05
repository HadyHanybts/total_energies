// // Promotion list with search
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:total_energies/core/constant/colors.dart';
// import 'package:total_energies/screens/promotion_details_screen.dart';
// import 'package:total_energies/widgets/components/promo_card.dart';

// class PromotionsScreen extends StatefulWidget {
//   const PromotionsScreen({super.key});

//   @override
//   State<PromotionsScreen> createState() => _PromotionsScreenState();
// }

// class _PromotionsScreenState extends State<PromotionsScreen> {
//   final List<Map<String, dynamic>> promotions = [
//     {
//       "imageAsset": "assets/images/logo.png",
//       "title": "Summer Sale",
//       "description": "Get 50% off on all items!",
//       "icon": Icons.favorite,
//       "total": 100,
//       "used": 30,
//     },
//     {
//       "imageAsset": "assets/images/logo.png",
//       "title": "Buy 1 Get 1 Free",
//       "description": "Limited time offer on selected items!",
//       "icon": Icons.favorite,
//       "total": 200,
//       "used": 120,
//     },
//     {
//       "imageAsset": "assets/images/logo.png",
//       "title": "Weekend Special",
//       "description": "Exclusive discounts this weekend only!",
//       "icon": Icons.favorite,
//       "total": 50,
//       "used": 50,
//     },
//   ];

//   String _filter = "current";
//   String name = "";

//   void _setFilter(String filter) {
//     setState(() {
//       _filter = filter;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     loadUserData();
//   }

//   void loadUserData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       name = prefs.getString('username') ?? "";
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     List<Map<String, dynamic>> filteredPromotions = promotions.where((promo) {
//       if (_filter == "current") {
//         return promo["total"] != promo["used"];
//       } else {
//         return promo["total"] == promo["used"];
//       }
//     }).toList();

//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 226, 221, 221),
//       appBar: AppBar(
//         backgroundColor: secondColors,
//         title: Container(
//           child: Row(
//             children: Directionality.of(context) == TextDirection.rtl
//                 ? [
//                     Text("Hi: $name", style: TextStyle(fontSize: 18)),
//                     Spacer(),
//                     SizedBox(
//                       height: kToolbarHeight, // Matches the AppBar's height
//                       child: Image.asset(
//                         "assets/images/logo.png",
//                         fit: BoxFit
//                             .contain, // Makes image cover entire container
//                       ),
//                     ),
//                   ]
//                 : [
//                     SizedBox(
//                       height: kToolbarHeight, // Matches the AppBar's height
//                       child: Image.asset(
//                         "assets/images/logo.png",
//                         fit: BoxFit
//                             .contain, // Makes image cover entire container
//                       ),
//                     ),
//                     Spacer(),
//                     Column(
//                       children: [
//                         Text("Hi",
//                             style: TextStyle(
//                                 fontSize: 18,
//                                 color: primaryColor,
//                                 fontWeight: FontWeight.bold)),
//                         Text(name,
//                             style: TextStyle(
//                                 fontSize: 18,
//                                 color: primaryColor,
//                                 fontWeight: FontWeight.bold))
//                       ],
//                     ),
//                     // Text("Hi: $name", style: TextStyle(fontSize: 18)),
//                   ],
//           ),
//         ),
//       ),
//       body: Container(
//         margin: EdgeInsets.only(top: 20),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: () => _setFilter("current"),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor:
//                         _filter == "current" ? primaryColor : Colors.grey,
//                   ),
//                   child: Text(
//                     "Current",
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16),
//                   ),
//                 ),
//                 SizedBox(width: 10),
//                 ElevatedButton(
//                   onPressed: () => _setFilter("old"),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor:
//                         _filter == "old" ? primaryColor : Colors.grey,
//                   ),
//                   child: Text(
//                     "Old",
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16),
//                   ),
//                 ),
//               ],
//             ),
//             Expanded(
//               child: ListView.builder(
//                 padding: EdgeInsets.all(10),
//                 itemCount: filteredPromotions.length,
//                 itemBuilder: (context, index) {
//                   final promo = filteredPromotions[index];
//                   return GestureDetector(
//                     onTap: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => PromoDetailsScreen(promo: promo),
//                       ),
//                     ),
//                     child: PromoCard(
//                       imageAsset: promo["imageAsset"],
//                       title: promo["title"],
//                       description: promo["description"],
//                       // icon: promo["icon"],
//                       total: promo["total"],
//                       used: promo["used"],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:total_energies/models/promotions_model.dart';
// import 'package:total_energies/services/promotions_service.dart';
// import 'package:total_energies/widgets/components/promo_card.dart';

// class PromotionsScreen extends StatefulWidget {
//   const PromotionsScreen({Key? key}) : super(key: key);

//   @override
//   _PromotionsScreenState createState() => _PromotionsScreenState();
// }

// class _PromotionsScreenState extends State<PromotionsScreen> {
//   late Future<List<PromotionsModel>> _futurePromotions;
//   final PromotionsService _promotionsService = PromotionsService();

//   @override
//   void initState() {
//     super.initState();
//     _futurePromotions = _promotionsService.getPromotions();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Promotions'),
//         centerTitle: true,
//       ),
//       body: FutureBuilder<List<PromotionsModel>>(
//         future: _futurePromotions,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return const Center(child: Text('No promotions available.'));
//           }

//           List<PromotionsModel> promotions = snapshot.data!;

//           return ListView.builder(
//             padding: const EdgeInsets.all(10),
//             itemCount: promotions.length,
//             itemBuilder: (context, index) {
//               final promo = promotions[index];
//               return PromoCard(
//                 imageAsset: promo.imagePath,
//                 title: promo.eventTopic,
//                 description: promo.eventEnDescription,
//                 icon: Icons.favorite_border,
//                 total: promo.qrMaxUsage,
//                 used: 0, // Modify if you have data for used count
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// works welll
// import 'package:flutter/material.dart';
// import 'package:total_energies/models/promotions_model.dart';
// import 'package:total_energies/services/promotions_service.dart';
// import 'package:total_energies/widgets/components/promo_card.dart';

// class PromotionsScreen extends StatefulWidget {
//   const PromotionsScreen({Key? key}) : super(key: key);

//   @override
//   _PromotionsScreenState createState() => _PromotionsScreenState();
// }

// class _PromotionsScreenState extends State<PromotionsScreen> {
//   late Future<List<PromotionsModel>> _futurePromotions;
//   final PromotionsService _promotionsService = PromotionsService();

//   @override
//   void initState() {
//     super.initState();
//     _futurePromotions = _promotionsService.getPromotions();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Promotions'),
//         centerTitle: true,
//       ),
//       body: FutureBuilder<List<PromotionsModel>>(
//         future: _futurePromotions,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return const Center(child: Text('No promotions available.'));
//           }

//           List<PromotionsModel> promotions = snapshot.data!;

//           return ListView.builder(
//             padding: const EdgeInsets.all(10),
//             itemCount: promotions.length,
//             itemBuilder: (context, index) {
//               final promo = promotions[index];

//               // Default image logic
//               String imagePath = (promo.imagePath.isEmpty)
//                   ? promo.imagePath
//                   : 'assets/images/logo.png';

//               return PromoCard(
//                 imageAsset: imagePath,
//                 title: promo.eventTopic,
//                 description: promo.eventEnDescription,
//                 icon: Icons.favorite,
//                 total: promo.qrMaxUsage,
//                 used: 0, // Modify if needed
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// promotions with details
// import 'package:flutter/material.dart';
// import 'package:total_energies/models/promotions_model.dart';
// import 'package:total_energies/services/promotions_service.dart';
// import 'package:total_energies/widgets/components/promo_card.dart';
// import 'package:total_energies/screens/promotion_details_screen.dart';

// class PromotionsScreen extends StatefulWidget {
//   const PromotionsScreen({Key? key}) : super(key: key);

//   @override
//   _PromotionsScreenState createState() => _PromotionsScreenState();
// }

// class _PromotionsScreenState extends State<PromotionsScreen> {
//   late Future<List<PromotionsModel>> _futurePromotions;
//   final PromotionsService _promotionsService = PromotionsService();

//   @override
//   void initState() {
//     super.initState();
//     _futurePromotions = _promotionsService.getPromotions();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Promotions'),
//         centerTitle: true,
//       ),
//       body: FutureBuilder<List<PromotionsModel>>(
//         future: _futurePromotions,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return const Center(child: Text('No promotions available.'));
//           }

//           List<PromotionsModel> promotions = snapshot.data!;

//           return ListView.builder(
//             padding: const EdgeInsets.all(10),
//             itemCount: promotions.length,
//             itemBuilder: (context, index) {
//               final promo = promotions[index];

//               // Default image logic
//               String imagePath = promo.imagePath.isEmpty
//                   ? promo.imagePath
//                   : 'assets/images/logo.png';

//               return PromoCard(
//                 imageAsset: imagePath,
//                 title: promo.eventTopic,
//                 description: promo.eventEnDescription,
//                 icon: Icons.favorite,
//                 total: promo.qrMaxUsage,
//                 used: 0,
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) =>
//                           PromotionDetailsScreen(promotion: promo),
//                     ),
//                   );
//                 },
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:total_energies/core/constant/colors.dart';
import 'package:total_energies/models/promotions_model.dart';
import 'package:total_energies/services/promotions_service.dart';
import 'package:total_energies/widgets/components/promo_card.dart';
import 'package:total_energies/screens/promotion_details_screen.dart';

class PromotionsScreen extends StatefulWidget {
  const PromotionsScreen({super.key});

  @override
  _PromotionsScreenState createState() => _PromotionsScreenState();
}

class _PromotionsScreenState extends State<PromotionsScreen> {
  late Future<List<PromotionsModel>> _futurePromotions;
  final PromotionsService _promotionsService = PromotionsService();

  String selectedFilter = 'All'; // Default filter

  @override
  void initState() {
    super.initState();
    _futurePromotions = _promotionsService.getPromotions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Promotions'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Filter Buttons
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _filterButton('All'),
                _filterButton('Current'),
                _filterButton('Old'),
              ],
            ),
          ),
          // Promotions List
          Expanded(
            child: FutureBuilder<List<PromotionsModel>>(
              future: _futurePromotions,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No promotions available.'));
                }

                // Filter promotions based on selected filter
                List<PromotionsModel> promotions = snapshot.data!;
                List<PromotionsModel> filteredPromotions =
                    promotions.where((promo) {
                  if (selectedFilter == 'Current') {
                    return promo.qrMaxUsage >
                        0; // Current promotions (still available)
                  } else if (selectedFilter == 'Old') {
                    return promo.qrMaxUsage == 0; // Old promotions (fully used)
                  }
                  return true; // Show all promotions
                }).toList();

                return ListView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: filteredPromotions.length,
                  itemBuilder: (context, index) {
                    final promo = filteredPromotions[index];

                    // Default image logic
                    // String imagePath = promo.imagePath.isEmpty
                    //     ? promo.imagePath
                    //     : 'assets/images/logo.png';

                    return Directionality.of(context) != TextDirection.rtl
                        ? PromoCard(
                            imageAsset: promo.imagePath.isEmpty
                                ? promo.imagePath
                                : 'assets/images/logo.png',
                            title: promo.eventTopic,
                            description: promo.eventEnDescription,
                            icon: Icons.favorite_border_outlined,
                            total: promo.qrMaxUsage,
                            used: 0,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      PromotionDetailsScreen(promotion: promo),
                                ),
                              );
                            },
                          )
                        : PromoCard(
                            imageAsset: promo.imagePath.isEmpty
                                ? promo.imagePath
                                : 'assets/images/logo1.png',
                            title: promo.eventTopic,
                            description: promo
                                .eventDescription, // Arabic description for RTL
                            icon: Icons.favorite,
                            total: promo.qrMaxUsage,
                            used: 0,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      PromotionDetailsScreen(promotion: promo),
                                ),
                              );
                            },
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

  // Widget for filter buttons
  Widget _filterButton(String filter) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedFilter = filter;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: selectedFilter == filter ? primaryColor : Colors.grey,
        foregroundColor: Colors.white,
      ),
      child: Text(filter),
    );
  }
}
