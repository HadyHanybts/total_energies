import 'package:flutter/material.dart';

class PromoCard extends StatefulWidget {
  final String imageAsset;
  final String title;
  final String description;
  final IconData? icon;
  final int total;
  final int used;

  const PromoCard({
    super.key,
    required this.imageAsset,
    required this.title,
    required this.description,
    this.icon,
    required this.total,
    required this.used,
  });

  @override
  _PromoCardState createState() => _PromoCardState();
}

class _PromoCardState extends State<PromoCard> {
  Color _iconColor = Colors.white;

  void _changeIconColor() {
    setState(() {
      _iconColor = _iconColor == Colors.white ? Colors.red : Colors.white;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
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
              Image.asset(
                widget.imageAsset,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
              Positioned(
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
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  color: Colors.white,
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
              Positioned(
                right: 10,
                bottom: 5,
                child: Text(
                  "${widget.used} / ${widget.total}",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
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
