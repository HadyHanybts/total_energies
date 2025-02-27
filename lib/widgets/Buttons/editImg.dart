import 'package:flutter/material.dart';

class RoundImageRow extends StatelessWidget {
  final String imageUrl;
  final String text;
  final IconData icon;

  const RoundImageRow({
    super.key,
    required this.imageUrl,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Round Image with Icon at the bottom right
          Stack(
            clipBehavior: Clip.none,
            children: [
              // Circular Image
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(imageUrl),
              ),
              // Icon at the bottom right of the image
              Positioned(
                bottom: -5,
                right: -5,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 12,
                  child: Icon(
                    icon,
                    color: Colors.blue,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 10), // Space between image and text
          // Text beside the image
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
