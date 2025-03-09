import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:total_energies/models/stations_model.dart';
import 'package:total_energies/services/station_service.dart';
// Adjust path as needed

class StationDropdown extends StatefulWidget {
  final Function(StationModel?)? onChanged; // Callback function

  const StationDropdown({super.key, this.onChanged});

  @override
  _StationDropdownState createState() => _StationDropdownState();
}

class _StationDropdownState extends State<StationDropdown> {
  final StationService _stationService = StationService();
  List<StationModel> _stations = [];
  StationModel? _selectedStation;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchStations();
  }

  Future<void> _fetchStations() async {
    try {
      List<StationModel> stations = await _stationService.getOnlyStations();
      setState(() {
        _stations = stations;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      Directionality.of(context) != TextDirection.rtl
          ? print("خطأ في جلب المحطات:  $e")
          : print("Error fetching stations: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const CircularProgressIndicator() // Show loader while fetching
        : DropdownButtonFormField<StationModel>(
            value: _selectedStation,
            hint: Text(
              'promotion_det_page.select_station'.tr,
              style: TextStyle(color: Colors.black),
            ),
            isExpanded: true,
            menuMaxHeight: 200,
            itemHeight: 50,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white, // Background color
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30), // Rounded borders
                borderSide: BorderSide.none, // Remove default border
              ),
            ),
            items: _stations.map((station) {
              return DropdownMenuItem<StationModel>(
                value: station,
                child: Text(
                  Directionality.of(context) != TextDirection.rtl
                      ? station.stationName
                      : station.stationArabicName,
                ),
              );
            }).toList(),
            onChanged: (station) {
              setState(() {
                _selectedStation = station;
              });
              if (widget.onChanged != null) {
                widget.onChanged!(station);
              }
            },
          );
  }
}
