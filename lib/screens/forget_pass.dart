// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl_phone_field/phone_number.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:total_energies/core/constant/colors.dart';
// import 'package:total_energies/screens/profile_screen.dart';
// import 'package:total_energies/services/user_service.dart';
// import 'package:total_energies/widgets/auth/header.dart';
// import 'package:total_energies/widgets/components/phone.dart';
// import '../models/user_model.dart';

// class ForgetPass extends StatefulWidget {
//   const ForgetPass({super.key});

//   @override
//   _ForgetPassState createState() => _ForgetPassState();
// }

// class _ForgetPassState extends State<ForgetPass> {
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();

//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   final UserService apiService = UserService();

//   void login() async {
//     // ✅ Check if the form is valid before proceeding
//     if (!_formKey.currentState!.validate()) {
//       return; // Stop execution if validation fails
//     }

//     List<UserModel> users = await apiService.getUsers();
//     UserModel? user = users.firstWhere(
//       (user) =>
//           user.phoneNumber == _phoneController.text &&
//           user.email == _emailController.text,
//       orElse: () => UserModel(
//           serial: -1,
//           name: "",
//           phoneNumber: "",
//           birthDate: "",
//           carModel: "",
//           email: "",
//           gender: "",
//           cityCode: 0,
//           carModelYear: 0,
//           password: ''),
//     );

//     if (user.serial != -1) {
//       // Save user data in SharedPreferences
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       prefs.setInt('id', user.serial!);
//       prefs.setString('name', user.name);
//       prefs.setString('phoneNumber', user.phoneNumber);
//       prefs.setString('birthDate', user.birthDate);
//       prefs.setString('carModel', user.carModel);
//       prefs.setString('email', user.email);
//       prefs.setString('gender', user.gender);
//       prefs.setInt('cityCode', user.cityCode);

//       // Navigate to Profile Page
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => ProfileScreen()),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Invalid Credentials")),
//       );
//     }
//   }

//   // Phone number validation function
//   String? _validatePhone(PhoneNumber? phone) {
//     if (phone == null || phone.number.isEmpty) {
//       return 'forget_page.empty_verification'.tr;
//     }
//     return null;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: backgroundColor,
//       appBar: AppBar(
//         backgroundColor: backgroundColor,
//         iconTheme: IconThemeData(color: appbariconColors),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               Header(Title: 'forget_page.title'.tr),
//               CustPhoneField(
//                 controller: _phoneController,
//                 labelText: 'login_page.phone_no'.tr,
//                 hintText: 'login_page.phone_no_hint'.tr,
//                 initialCountryCode: "EG",
//                 validator: _validatePhone,
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               ElevatedButton(
//                 onPressed: login,
//                 style: ButtonStyle(
//                   backgroundColor: WidgetStatePropertyAll(primaryColor),
//                   // fixedSize:
//                   //     WidgetStateProperty.all(Size(double.maxFinite, 20)),
//                 ),
//                 child: Text(
//                   'forget_page.forget_btn'.tr,
//                   style: TextStyle(color: btntxtColors, fontSize: 20),
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
import 'package:intl_phone_field/phone_number.dart';
import 'package:total_energies/core/constant/colors.dart';
import 'package:total_energies/services/user_service.dart';
import 'package:total_energies/widgets/auth/header.dart';
import 'package:total_energies/widgets/components/custTxtField.dart';
import 'package:total_energies/widgets/components/phone.dart';

class ForgetPass extends StatefulWidget {
  const ForgetPass({super.key});

  @override
  _ForgetPassState createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final UserService apiService = UserService();

  bool _showOtpField = false;

  void sendOtp() {
    if (_phoneController.text.isNotEmpty) {
      setState(() {
        _showOtpField = true;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter your phone number")),
      );
    }
  }

  String? _validatePhone(PhoneNumber? phone) {
    if (phone == null || phone.number.isEmpty) {
      return 'forget_page.empty_verification'.tr;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        iconTheme: IconThemeData(color: appbariconColors),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(Title: 'forget_page.title'.tr),
              CustPhoneField(
                controller: _phoneController,
                labelText: 'login_page.phone_no'.tr,
                hintText: 'login_page.phone_no_hint'.tr,
                initialCountryCode: "EG",
                validator: _validatePhone,
              ),
              if (_showOtpField) ...[
                SizedBox(height: 10),
                Custtxtfield(
                  controller: _otpController,
                  labelText: 'Enter OTP',
                  hintText: 'Enter OTP number',
                  keyboardType: TextInputType.emailAddress,
                  // validator: _validateEmail,
                  // prefixIcon: Icons.mail,
                ),
              ],
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: sendOtp,
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(primaryColor),
                ),
                child: Text(
                  'Send OTP',
                  style: TextStyle(color: btntxtColors, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
