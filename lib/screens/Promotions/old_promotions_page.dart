import 'package:flutter/material.dart';
import 'package:total_energies/core/constant/colors.dart';
import 'package:total_energies/models/promotions_model.dart';
import 'package:total_energies/screens/loading_screen.dart';
import 'package:total_energies/services/promotions_service.dart';
import 'package:total_energies/widgets/Promotions/old_promo_card.dart';
import 'package:total_energies/screens/Promotions/promotion_details_screen.dart';

class OldPromotionsPage extends StatefulWidget {
  const OldPromotionsPage({super.key});

  @override
  _OldPromotionsPageState createState() => _OldPromotionsPageState();
}

class _OldPromotionsPageState extends State<OldPromotionsPage> {
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
      // appBar: AppBar(
      //   backgroundColor: backgroundColor,
      //   // iconTheme: IconThemeData(color: Colors.white),
      //   title: Container(
      //     child: Row(
      //       children: [
      //         SizedBox(
      //           height: kToolbarHeight, // Matches the AppBar's height
      //           child: Image.asset(
      //             "assets/images/logo.png",
      //             fit: BoxFit.contain, // Makes image cover entire container
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
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
                  ? OldPromoCard(
                      imagepath: promo.imagePath??'',
                      title: promo.eventTopic,
                      description: promo.eventEnDescription,
                      startDate: promo.startDate,
                      endDate: promo.endDate,
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
                  : OldPromoCard(
                      imagepath: promo.imagePath??'',
                      title: promo.eventTopic,
                      description: promo.eventDescription,
                      startDate: promo.startDate,
                      endDate: promo.endDate,
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
    );
  }
}
