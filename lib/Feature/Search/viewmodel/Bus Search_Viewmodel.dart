import 'dart:math';

import 'package:busapp/Core/Services/citycordinates.dart';
import 'package:busapp/Feature/Search/model/Bus_route_model.dart';
import 'package:flutter/material.dart';

class Bussearchviewmodel extends ChangeNotifier {
  String _tocity = '';
  String _fromcity = '';
  DateTime? _departure;
  String _busselecttype = "AC";
  bool _isloading = false;
  String get tocity => _tocity;
  String get fromcity => _fromcity;
  DateTime? get departuredtime => _departure;
  String get selectbustype => _busselecttype;
  bool get isLoading => _isloading;
  List<BusRouteModel> _popularroutes = [];
  List<BusRouteModel> get popularRoutes => _popularroutes;
  List<BusRouteModel> _filterroute = [];
  List<BusRouteModel> get filterroute => _filterroute;

  List<String> citylist = [
    'Amritsar',
    'Barnala',
    'Bathinda',
    'Faridkot',
    'Fatehgarh Sahib',
    'Fazilka',
    'Ferozepur',
    'Gurdaspur',
    'Hoshiarpur',
    'Jalandhar',
    'Kapurthala',
    'Ludhiana',
    'Malerkotla',
    'Mansa',
    'Moga',
    'Mohali',
    'Muktsar',
    'Nawanshahr',
    'Pathankot',
    'Patiala',
    'Rupnagar',
    'Sangrur',
    'Tarn Taran',
    'Chandigarh',
    'Abohar',
    'Batala',
    'Khanna',
    'Phagwara',
    'Rajpura',
    'Zirakpur',
    'Samrala',
    'Sunam',
    'Dhuri',
    'Kotkapura',
    'Jagraon',
    'Nakodar',
    'Dasuya',
    'Anandpur Sahib',
    'Kharar',
    'Morinda',
    'Nangal',
    'Malout',
    'Budhlada',
    'Lehragaga',
    'Patti',
    'Sultanpur Lodhi',
    'Talwandi Sabo',
  ];

  //distance calcualtion

  double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    const earthRadius = 6371; // km

    final dLat = (lat2 - lat1) * pi / 180;
    final dLon = (lon2 - lon1) * pi / 180;

    final a =
        sin(dLat / 2) * sin(dLat / 2) +
        cos(lat1 * pi / 180) *
            cos(lat2 * pi / 180) *
            sin(dLon / 2) *
            sin(dLon / 2);

    final c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return earthRadius * c;
  }

  void updateCity(String city) {
    _tocity = city;
    notifyListeners();
  }

  void selectBusType(String type) {
    _busselecttype = type;
    notifyListeners();
  }

  void updateDepartureTime(DateTime date) {
    _departure = date;
    notifyListeners();
  }

  void settocity(String City) {
    _tocity = City;
    notifyListeners();
  }

  void setfromcity(String City) {
    _fromcity = City;
    notifyListeners();
  }

  Future<void> popularroutelist() async {
    _isloading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));

    _popularroutes = [];
    //pricning llogic
    final cities = cityCoordinates.keys.toList();

    for (final from in cities) {
      for (final to in cities) {
        if (from == to) continue;
        final fromLoc = cityCoordinates[from]!;
        final toLoc = cityCoordinates[to]!;

        final distance = calculateDistance(
          fromLoc.lat,
          fromLoc.lng,
          toLoc.lat,
          toLoc.lng,
        );
        final price = (distance * 2).round();
        _popularroutes.add(
          BusRouteModel(
            fromcity: from,
            tocity: to,
            startingprice: price,
            reviews: 2,
            totalreviwews: 100,
            frequency: distance < 100
                ? '15 min'
                : distance < 200
                ? '30 min'
                : '1 hr',
          ),
        );
      }
    }
    _isloading = false;
    notifyListeners();
  }

  void bussearch({
    required String from,
    required String to,
    required String bustype,
  }) {
    if (from.isEmpty || to.isEmpty) {
      _filterroute = [];
      notifyListeners();
      return;
    }
    _filterroute = _popularroutes.where((route) {
      final matchFrom =
          route.fromcity.trim().toLowerCase() == from.trim().toLowerCase();
      final matchTo =
          route.tocity.trim().toLowerCase() == to.trim().toLowerCase();

      return matchFrom && matchTo;
    }).toList();

    notifyListeners();
  }
}
