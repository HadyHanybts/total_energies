import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:total_energies/core/constant/colors.dart';
import 'package:total_energies/screens/edit_profile_screen.dart';
import 'package:total_energies/screens/loginPage.dart';
import 'package:total_energies/widgets/Buttons/editImg.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = "";
  String phoneno = "";
  String gender = "";
  String email = "";

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  void loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('username') ?? "";
      phoneno = prefs.getString('phoneno') ?? "";
      gender = prefs.getString('gender') ?? "";
      email = prefs.getString('email') ?? "";
    });
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        iconTheme: IconThemeData(color: Colors.white),
        title: Container(
          child: Row(
            children: [
              SizedBox(
                height: kToolbarHeight, // Matches the AppBar's height
                child: Image.asset(
                  "assets/images/logo.png",
                  fit: BoxFit.contain, // Makes image cover entire container
                ),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: logout,
                child: Text("btn.logout".tr),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      primaryColor, // Change this to your desired color
                  foregroundColor: Colors.white, // Text color
                  padding: EdgeInsets.symmetric(
                      horizontal: 20, vertical: 12), // Button padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RoundImageRow(
              imageUrl: 'assets/images/logo.png',
              text: 'profile_page.acc_inf'.tr,
              icon: Icons.edit,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('profile_page.name'.tr, style: TextStyle(fontSize: 18)),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("$name", style: TextStyle(fontSize: 18)),
                    Icon(Icons.arrow_forward_rounded)
                  ],
                ),
              ],
            ),
            Container(
              color: Colors.white,
              height: 3,
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 15),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('profile_page.phone_number'.tr,
                    style: TextStyle(fontSize: 18)),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("$phoneno", style: TextStyle(fontSize: 18)),
                    Icon(Icons.arrow_forward_rounded)
                  ],
                ),
              ],
            ),
            Container(
              color: Colors.white,
              height: 3,
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 15),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('profile_page.gender'.tr, style: TextStyle(fontSize: 18)),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("$gender", style: TextStyle(fontSize: 18)),
                    Icon(Icons.arrow_forward_rounded)
                  ],
                ),
              ],
            ),
            Container(
              color: Colors.white,
              height: 3,
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 15),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('profile_page.email'.tr, style: TextStyle(fontSize: 18)),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("$email", style: TextStyle(fontSize: 18)),
                    Icon(Icons.arrow_forward_rounded)
                  ],
                ),
              ],
            ),
            Container(
              color: Colors.white,
              height: 3,
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 15),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfileScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    primaryColor, // Change this to your desired color
                foregroundColor: Colors.white, // Text color
                padding: EdgeInsets.symmetric(
                    horizontal: 20, vertical: 12), // Button padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
              ),
              child: Text('btn.edit_profile'.tr),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
