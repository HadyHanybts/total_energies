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
