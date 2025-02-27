import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  final String imageAsset;
  final String title;
  final String description;
  final IconData icon;

  const CustomCard({
    super.key,
    required this.imageAsset,
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  Color _iconColor = Colors.white;

  void _changeIconColor() {
    setState(() {
      _iconColor = _iconColor == Colors.white ? Colors.red : Colors.white;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: [
              // Image at the top of the card (using Image.asset)
              Image.asset(
                widget.imageAsset,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
              // Icon at the top right of the card with onPressed
              Positioned(
                right: 8,
                top: 8,
                child: GestureDetector(
                  onTap: _changeIconColor, // Change color when tapped
                  child: Icon(
                    widget.icon,
                    color: _iconColor, // Color that changes on tap
                    size: 30,
                  ),
                ),
              ),
              // Title and description at the bottom of the card with background color
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  color: Colors.white, // Background color with opacity
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        widget.description,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
