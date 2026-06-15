import 'package:busapp/Feature/Search/model/Bus_route_model.dart';
import 'package:flutter/material.dart';

class Bussearchviewmodel extends ChangeNotifier {
  String _tocity = "Chandigarh";
  final String _fromcity = "Amritsar";
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

  // Fetch popular routes from data layer
  Future<void> popularroutelist() async {
    _isloading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));

    _popularroutes = [
      BusRouteModel(
        fromcity: 'Amritsar',
        tocity: 'Patiala',
        startingprice: 399,
        reviews: 4,
        totalreviwews: 2.9,
      ),
      BusRouteModel(
        fromcity: 'patiala',
        tocity: 'Sangrur',
        startingprice: 700,
        reviews: 3,
        totalreviwews: 100,
      ),
      BusRouteModel(
        fromcity: 'Jhlandhar',
        tocity: 'chandigarh',
        startingprice: 500,
        reviews: 5,
        totalreviwews: 4.9,
      ),
      BusRouteModel(
        fromcity: 'chandigarh',
        tocity: 'Sangrur',
        startingprice: 399,
        reviews: 4,
        totalreviwews: 3.76,
      ),
      BusRouteModel(
        fromcity: 'Sangrur',
        tocity: 'patiala',
        startingprice: 700,
        reviews: 3,
        totalreviwews: 1.00,
      ),
      BusRouteModel(
        fromcity: 'Jhlandhar',
        tocity: 'chandigarh',
        startingprice: 500,
        reviews: 5,
        totalreviwews: 4.00,
      ),
    ];

    _isloading = false;
    notifyListeners();
  }
}
