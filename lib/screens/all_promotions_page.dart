import 'package:flutter/material.dart';
import 'package:total_energies/core/constant/colors.dart';
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
      backgroundColor: backgroundColor,
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
              print(promo);
              return Directionality.of(context) != TextDirection.rtl
                  ? PromoCard(
                      serial: promo.serial,
                      imagepath: promo.imagePath,
                      title: promo.eventTopic,
                      description: promo.eventEnDescription,
                      startDate: promo.startDate,
                      endDate: promo.endDate,
                      promodet: promo.promotionDetails.isNotEmpty
                          ? promo.promotionDetails[0].promotionCode
                          : "N/A",
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
                      serial: promo.serial,
                      imagepath: promo.imagePath,
                      title: promo.eventDescription,
                      description: promo.eventArDescription,
                      startDate: promo.startDate,
                      endDate: promo.endDate,
                      promodet: promo.promotionDetails.isNotEmpty
                          ? promo.promotionDetails[0].promotionCode
                          : "N/A",
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
