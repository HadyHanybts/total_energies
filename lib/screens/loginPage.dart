import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:total_energies/core/constant/colors.dart';
import 'package:total_energies/models/login_model.dart';
import 'package:total_energies/screens/forget_pass.dart';
import 'package:total_energies/screens/home_screen.dart';
import 'package:total_energies/screens/register_screen.dart';
import 'package:total_energies/screens/testing.dart';
import 'package:total_energies/services/login_service.dart';
import 'package:total_energies/widgets/auth/header.dart';
import 'package:total_energies/widgets/components/custPassField.dart';
import 'package:total_energies/widgets/components/phone.dart';
import 'package:total_energies/widgets/Buttons/trnslt_btn.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final LoginService apiService = LoginService();

  void login() async {
    // Check if the form is valid before proceeding
    if (!_formKey.currentState!.validate()) {
      return; // Stop execution if validation fails
    }

    LoginModel user = LoginModel(
      userName: _usernameController.text,
      password: _passwordController.text,
    );

    var Res = await apiService.loginuser(user);
    int success = Res.statusCode;
    String mess = Res.body;

// Decode the JSON response
    var responseData = jsonDecode(mess); // Converts JSON string into a Map
    String name = responseData['name'];
        String gender = responseData['gender'];


    // Navigate to Profile Page
    if (success == 200) {
      print(Res.body);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('username', name);
      prefs.setString('phoneno', user.userName);
      prefs.setString('gender', gender);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
    // if (success == 200) Navigator.pop(context);
  }

  // Phone number validation function
  String? _validatePhone(PhoneNumber? phone) {
    if (phone == null || phone.number.isEmpty) {
      return 'login_page.empty_verification'.tr;
    }
    return null;
  }

// Password validation function
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'login_page.pass_verification'.tr;
    } else if (value.length < 6) {
      return 'login_page.pass_verification1'.tr;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Container(
          alignment: Alignment.centerRight,
          child: TranslateButton(),
        ),
      ),
      backgroundColor: backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Header(Title: 'login_page.title'.tr),
              CustPhoneField(
                controller: _usernameController,
                labelText: 'login_page.phone_no'.tr,
                hintText: 'login_page.phone_no_hint'.tr,
                initialCountryCode: "EG",
                validator: _validatePhone,
              ),
              CustPasswordField(
                controller: _passwordController,
                labelText: 'login_page.password'.tr,
                hintText: 'login_page.password_hint'.tr,
                validator: _validatePassword,
              ),
              Container(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgetPass()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.transparent, // Remove background color
                    shadowColor: Colors.transparent, // Remove shadow
                    elevation: 0,
                  ),
                  child: Text(
                    'login_page.forget_btn'.tr,
                    style: TextStyle(
                      color: inputTextColor,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: login,
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(primaryColor),
                  // fixedSize:
                  //     WidgetStateProperty.all(Size(double.maxFinite, 20)),
                ),
                child: Text(
                  'login_page.login_btn'.tr,
                  style: TextStyle(color: btntxtColors, fontSize: 20),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.transparent, // Remove background color
                  shadowColor: Colors.transparent, // Remove shadow
                  elevation: 0,
                ),
                child: Text(
                  'login_page.register_btn'.tr,
                  style: TextStyle(
                    color: inputTextColor,
                    fontSize: 20,
                    decoration: TextDecoration.underline,
                    decorationColor: inputTextColor,
                    decorationThickness: 2.0,
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
                    MaterialPageRoute(builder: (context) => Testing()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.transparent, // Remove background color
                  shadowColor: Colors.transparent, // Remove shadow
                  elevation: 0,
                ),
                child: Text(
                  "Testing",
                  style: TextStyle(
                    color: Colors.transparent,
                    fontSize: 15,
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
