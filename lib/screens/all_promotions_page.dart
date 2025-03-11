import 'package:flutter/material.dart';
import 'package:total_energies/models/promotions_model.dart';
import 'package:total_energies/screens/loading_screen.dart';
import 'package:total_energies/services/promotions_service.dart';
import 'package:total_energies/widgets/components/promo_card.dart';
import 'package:total_energies/screens/promotion_details_screen.dart';

class AllPromotionsPage extends StatefulWidget {
  const AllPromotionsPage({super.key});

  @override
  _AllPromotionsPageState createState() => _AllPromotionsPageState();
}

class _AllPromotionsPageState extends State<AllPromotionsPage> {
  late Future<List<PromotionsModel>> _futurePromotions;
  final PromotionsService _promotionsService = PromotionsService();

  @override
  void initState() {
    super.initState();
    _futurePromotions = _promotionsService.getPromotions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<PromotionsModel>>(
        future: _futurePromotions,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: LoadingScreen());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No promotions available.'));
          }

          List<PromotionsModel> promotions = snapshot.data!;

          return ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: promotions.length,
            itemBuilder: (context, index) {
              final promo = promotions[index];

              return Directionality.of(context) != TextDirection.rtl
                  ? PromoCard(
                      imageAsset: promo.imagePath.isEmpty
                          ? promo.imagePath
                          : 'assets/images/logo.png',
                      title: promo.eventTopic,
                      description: promo.eventEnDescription,
                      startDate: promo.startDate,
                      endDate: promo.endDate,
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
                      description: promo.eventDescription,
                      startDate: promo.startDate,
                      endDate: promo.endDate,
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
    );
  }
}
