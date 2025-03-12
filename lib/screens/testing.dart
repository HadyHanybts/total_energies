import 'package:flutter/material.dart';
import 'package:total_energies/screens/home_screen.dart';
import 'package:total_energies/screens/promotions_screen.dart';
import 'package:total_energies/screens/stations_screen.dart';
import 'package:total_energies/widgets/Buttons/editImg.dart';
import 'package:total_energies/widgets/components/circle.dart';
import 'package:total_energies/widgets/components/promo_card.dart';

class Testing extends StatefulWidget {
  const Testing({super.key});

  @override
  _TestingState createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RoundImageRow(
              imageUrl: 'assets/images/logo.png', // Your image asset path
              text: 'Your Text Here',
              icon: Icons.edit, // Example icon
            ),
            PromoCard(
              imagepath: 'assets/images/logo.png', // Your image asset path
              title: 'Card Title',
              description: 'This is a description of the card.',
              icon: Icons.favorite,
              total: 3,
              used: 1, onTap: () {},
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: PromoCircle(
                      backgroundColor: Colors.blue,
                      icon: Icons.location_on,
                    ),
                  ),
                  Expanded(
                    child: PromoCircle(
                      backgroundColor: Colors.green,
                      icon: Icons.car_repair,
                    ),
                  ),
                  Expanded(
                    child: PromoCircle(
                      backgroundColor: Colors.red,
                      icon: Icons.settings,
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StationListScreen()),
                );
              },
              child: Text(
                "Stations list",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PromotionsScreen()),
                );
              },
              child: Text(
                "Promotions Page",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: Text(
                "Home Page",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
