// import 'package:flutter/material.dart';
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
//       "used": 10,
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Promotions"),
//         centerTitle: true,
//       ),
//       body: ListView.builder(
//         padding: EdgeInsets.all(10),
//         itemCount: promotions.length,
//         itemBuilder: (context, index) {
//           final promo = promotions[index];
//           return PromoCard(
//             imageAsset: promo["imageAsset"],
//             title: promo["title"],
//             description: promo["description"],
//             icon: promo["icon"],
//             total: promo["total"],
//             used: promo["used"],
//           );
//         },
//       ),
//     );
//   }
// }

// Promotion list without search
// import 'package:flutter/material.dart';
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

//   void _navigateToDetails(BuildContext context, Map<String, dynamic> promo) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => PromoDetailsScreen(promo: promo),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Promotions"),
//         centerTitle: true,
//       ),
//       body: ListView.builder(
//         padding: EdgeInsets.all(10),
//         itemCount: promotions.length,
//         itemBuilder: (context, index) {
//           final promo = promotions[index];
//           return GestureDetector(
//             onTap: () => _navigateToDetails(context, promo),
//             child: PromoCard(
//               imageAsset: promo["imageAsset"],
//               title: promo["title"],
//               description: promo["description"],
//               icon: promo["icon"],
//               total: promo["total"],
//               used: promo["used"],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// Promotion list with search
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:total_energies/core/constant/colors.dart';
import 'package:total_energies/screens/promotion_details_screen.dart';
import 'package:total_energies/widgets/components/promo_card.dart';

class PromotionsScreen extends StatefulWidget {
  const PromotionsScreen({super.key});

  @override
  State<PromotionsScreen> createState() => _PromotionsScreenState();
}

class _PromotionsScreenState extends State<PromotionsScreen> {
  final List<Map<String, dynamic>> promotions = [
    {
      "imageAsset": "assets/images/logo.png",
      "title": "Summer Sale",
      "description": "Get 50% off on all items!",
      "icon": Icons.favorite,
      "total": 100,
      "used": 30,
    },
    {
      "imageAsset": "assets/images/logo.png",
      "title": "Buy 1 Get 1 Free",
      "description": "Limited time offer on selected items!",
      "icon": Icons.favorite,
      "total": 200,
      "used": 120,
    },
    {
      "imageAsset": "assets/images/logo.png",
      "title": "Weekend Special",
      "description": "Exclusive discounts this weekend only!",
      "icon": Icons.favorite,
      "total": 50,
      "used": 50,
    },
  ];

  String _filter = "current";
  String name = "";

  void _setFilter(String filter) {
    setState(() {
      _filter = filter;
    });
  }

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  void loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('username') ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredPromotions = promotions.where((promo) {
      if (_filter == "current") {
        return promo["total"] != promo["used"];
      } else {
        return promo["total"] == promo["used"];
      }
    }).toList();

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
                    // Text("Hi: $name", style: TextStyle(fontSize: 18)),
                  ],
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _setFilter("current"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        _filter == "current" ? primaryColor : Colors.grey,
                  ),
                  child: Text(
                    "Current",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _setFilter("old"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        _filter == "old" ? primaryColor : Colors.grey,
                  ),
                  child: Text(
                    "Old",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: filteredPromotions.length,
                itemBuilder: (context, index) {
                  final promo = filteredPromotions[index];
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PromoDetailsScreen(promo: promo),
                      ),
                    ),
                    child: PromoCard(
                      imageAsset: promo["imageAsset"],
                      title: promo["title"],
                      description: promo["description"],
                      // icon: promo["icon"],
                      total: promo["total"],
                      used: promo["used"],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
