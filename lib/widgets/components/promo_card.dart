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

class PromoCard extends StatefulWidget {
  final String imageAsset;
  final String title;
  final String description;
  final DateTime? startDate;
  final DateTime? endDate;
  final IconData? icon;
  final int? total;
  final int? used;
  final VoidCallback onTap; // New parameter

  const PromoCard({
    super.key,
    required this.imageAsset,
    required this.title,
    required this.description,
    this.startDate,
    this.endDate,
    this.icon,
    this.total,
    this.used,
    required this.onTap, // New parameter
  });

  @override
  _PromoCardState createState() => _PromoCardState();
}

class _PromoCardState extends State<PromoCard> {
  Color _iconColor = Colors.white;

  // Widget imageWidget(String imageUrl) {
  //   if (imageUrl.startsWith("http")) {
  //     return Image.network(
  //       imageUrl,
  //       width: double.infinity,
  //       height: 200,
  //       fit: BoxFit.cover,
  //       loadingBuilder: (context, child, loadingProgress) {
  //         if (loadingProgress == null) return child;
  //         return Center(
  //             child: CircularProgressIndicator()); // Show loader while loading
  //       },
  //       errorBuilder: (context, error, stackTrace) {
  //         return Image.asset(
  //           'assets/images/logo.png', // Fallback image
  //           width: double.infinity,
  //           height: 200,
  //           fit: BoxFit.cover,
  //         );
  //       },
  //     );
  //   } else {
  //     return Image.asset(
  //       imageUrl,
  //       width: double.infinity,
  //       height: 200,
  //       fit: BoxFit.cover,
  //     );
  //   }
  // }

  void _changeIconColor() {
    setState(() {
      _iconColor = _iconColor == Colors.white ? Colors.red : Colors.white;
    });
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
                // imageWidget(widget.imageAsset),
                Image.asset(
                  widget.imageAsset,
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
                // Icon
                Directionality.of(context) != TextDirection.rtl
                    ? Positioned(
                        right: 8,
                        top: 8,
                        child: GestureDetector(
                          onTap: _changeIconColor,
                          child: Icon(
                            widget.icon,
                            color: _iconColor,
                            size: 30,
                          ),
                        ),
                      )
                    : Positioned(
                        left: 8,
                        top: 8,
                        child: GestureDetector(
                          onTap: _changeIconColor,
                          child: Icon(
                            widget.icon,
                            color: _iconColor,
                            size: 30,
                          ),
                        ),
                      ),
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
                            color: Colors.black,
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
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Start Date: ${widget.startDate}",
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "End Date: ${widget.endDate}",
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                if (widget.used != null || widget.total != null)
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
