import 'package:flutter/material.dart';
import 'package:total_energies/core/constant/colors.dart';

class CurrPromoCard extends StatefulWidget {
  final int? serial;
  final String imagepath;
  final String title;
  final String description;
  final DateTime? startDate;
  final DateTime? endDate;
  final IconData? icon;
  final int? total;
  final int? used;
  final VoidCallback onTap; // New parameter
  final String? promodet;

  const CurrPromoCard({
    super.key,
    this.serial,
    required this.imagepath,
    required this.title,
    required this.description,
    this.startDate,
    this.endDate,
    this.icon,
    this.total,
    this.used,
    required this.onTap, // New parameter
    this.promodet,
  });

  @override
  _CurrPromoCardState createState() => _CurrPromoCardState();
}

final String baseUrl = "http://92.204.139.204:4335";

class _CurrPromoCardState extends State<CurrPromoCard> {
  Widget imageWidget(String imageUrl) {
    imageUrl = imageUrl.replaceAll("\\", "/");
    print('$baseUrl$imageUrl');
    return Image.network(
      '$baseUrl/$imageUrl',
      // 'http://92.204.139.204:4335//Event//1073//Profile.Jpg',
      width: double.infinity,
      height: 350,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
            child: CircularProgressIndicator()); // Show loader while loading
      },
      errorBuilder: (context, error, stackTrace) {
        return Image.asset(
          'assets/images/logo.png', // Fallback image
          width: double.infinity,
          height: 320,
          fit: BoxFit.cover,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap, // Handle navigation when tapped
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Card(
          color: Colors.grey,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              children: [
                // imageWidget('http://92.204.139.204:4335' + widget.imagepath),
                imageWidget(widget.imagepath),
                // text
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: const TextStyle(
                            color: primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.description,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Start Date: ${widget.startDate.toString().split(' ')[0]}",
                              // "Start Date: ${widget.startDate}",
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "End Date: ${widget.endDate.toString().split(' ')[0]}",
                                  // "End Date: ${widget.endDate}",
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${widget.used} / ${widget.total}",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
