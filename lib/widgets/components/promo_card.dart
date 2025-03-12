// import 'package:flutter/material.dart';

// class PromoCard extends StatefulWidget {
//   final String imageAsset;
//   final String title;
//   final String description;
//   final IconData? icon;
//   final int total;
//   final int used;

//   const PromoCard({
//     super.key,
//     required this.imageAsset,
//     required this.title,
//     required this.description,
//     this.icon,
//     required this.total,
//     required this.used,
//   });

//   @override
//   _PromoCardState createState() => _PromoCardState();
// }

// class _PromoCardState extends State<PromoCard> {
//   Color _iconColor = Colors.white;

//   void _changeIconColor() {
//     setState(() {
//       _iconColor = _iconColor == Colors.white ? Colors.red : Colors.white;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 10),
//       child: Card(
//         color: Colors.grey,
//         elevation: 5,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(10),
//           child: Stack(
//             children: [
//               Image.asset(
//                 widget.imageAsset,
//                 width: double.infinity,
//                 height: 200,
//                 fit: BoxFit.cover,
//               ),
//               Positioned(
//                 right: 8,
//                 top: 8,
//                 child: GestureDetector(
//                   onTap: _changeIconColor,
//                   child: Icon(
//                     widget.icon,
//                     color: _iconColor,
//                     size: 30,
//                   ),
//                 ),
//               ),
//               Positioned(
//                 bottom: 0,
//                 left: 0,
//                 right: 0,
//                 child: Container(
//                   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//                   color: Colors.white,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         widget.title,
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(height: 4),
//                       Text(
//                         widget.description,
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 14,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Positioned(
//                 right: 10,
//                 bottom: 5,
//                 child: Text(
//                   "${widget.used} / ${widget.total}",
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:total_energies/core/constant/colors.dart';
import 'package:total_energies/screens/promotion_details_screen.dart';

class PromoCard extends StatefulWidget {
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

  const PromoCard({
    super.key,
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
  _PromoCardState createState() => _PromoCardState();
}

class _PromoCardState extends State<PromoCard> {
  Widget imageWidget(String imageUrl) {
    return Image.network(
      'http://92.204.139.204:4335' + imageUrl,
      // imageUrl,
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
          'assets/images/logo1.png', // Fallback image
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
                // Image.network(
                //   'http://92.204.139.204:4335' + widget.imagepath,
                //   // widget.imagepath,
                //   width: double.infinity,
                //   height: 250,
                //   fit: BoxFit.cover,
                // ),
                // Image.asset(
                //   widget.imageAsset,
                //   width: double.infinity,
                //   height: 250,
                //   fit: BoxFit.cover,
                // ),
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
                                if (widget.used != null ||
                                    widget.total !=
                                        null) // Appears only in current
                                  Text(
                                    "${widget.used} / ${widget.total}",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                if (widget.used == null ||
                                    widget.total == null) // Appears in All
                                  Text(
                                    "Apply ${widget.promodet}",
                                    style: TextStyle(
                                        color: primaryColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
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
