import 'package:flutter/material.dart';
import 'package:total_energies/models/car_brands_model.dart';
import 'package:total_energies/services/car_brand_service.dart';
import 'package:total_energies/core/constant/colors.dart'; // Update with your color path

class CarBrandDropdown extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final String? Function(String?)? validator;
  final bool showAsterisk;

  const CarBrandDropdown({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    this.validator,
    this.showAsterisk = false,
  });

  @override
  _CarBrandDropdownState createState() => _CarBrandDropdownState();
}

class _CarBrandDropdownState extends State<CarBrandDropdown> {
  final CarBrandService _carBrandService = CarBrandService();
  List<CarBrand> _carBrands = [];
  bool _isLoading = true;

  // Getter for formatted label with optional asterisk
  Widget get formattedLabel {
    return RichText(
      text: TextSpan(
        text: widget.labelText,
        style: TextStyle(color: inputTextColor, fontSize: 16),
        children: widget.showAsterisk
            ? [
                TextSpan(
                  text: ' *',
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              ]
            : [],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _fetchCarBrands();
  }

  Future<void> _fetchCarBrands() async {
    try {
      List<CarBrand> carBrands = await _carBrandService.getCarBrands();
      setState(() {
        _carBrands = carBrands;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isArabic = Localizations.localeOf(context).languageCode == 'ar';

    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Theme(
            data: Theme.of(context).copyWith(
              canvasColor:
                  backgroundColor, // Change the dropdown menu background color
            ),
            child: DropdownButtonFormField<String>(
              menuMaxHeight: 200,
              value: widget.controller.text.isNotEmpty
                  ? widget.controller.text
                  : null,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: txtfieldborderColor, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: txtfieldborderColor, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                hintText: widget.hintText,
                hintStyle: TextStyle(color: inputTextColor),
                label: widget.showAsterisk
                    ? formattedLabel
                    : Text(widget.labelText),
                labelStyle: TextStyle(color: inputTextColor),
              ),
              items: _carBrands.map((CarBrand brand) {
                return DropdownMenuItem<String>(
                  value: brand.english, // Store English name as value
                  child: Text(
                    isArabic ? brand.arabic : brand.english,
                    style: TextStyle(color: inputTextColor),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  widget.controller.text = newValue ?? "";
                });
              },
              validator: widget.validator,
            ),
          ),
          if (_isLoading)
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                "Loading car brands...",
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }
}
