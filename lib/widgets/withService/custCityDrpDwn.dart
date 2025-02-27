
import 'package:flutter/material.dart';
import 'package:total_energies/core/constant/colors.dart';
import 'package:total_energies/models/city_model.dart';
import 'package:total_energies/services/city_service.dart';

class CustCityDropdown extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final String? Function(String?) validator;

  const CustCityDropdown({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.validator,
  });

  @override
  _CustCityDropdownState createState() => _CustCityDropdownState();
}

class _CustCityDropdownState extends State<CustCityDropdown> {
  final CityService _cityService = CityService();
  List<CityModel> _cities = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchCities();
  }

  Future<void> _fetchCities() async {
    try {
      List<CityModel> cities = await _cityService.getUsers();
      setState(() {
        _cities = cities;
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
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
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
                labelText: widget.labelText,
                labelStyle: TextStyle(color: inputTextColor),
              ),
              items: _cities.map((CityModel city) {
                return DropdownMenuItem<String>(
                  value: city.serial.toString(),
                  child: Text(
                    Directionality.of(context) != TextDirection.rtl
                        ? city.cityName
                        : city.cityArabicName,
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
                "Loading cities...",
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }
}
