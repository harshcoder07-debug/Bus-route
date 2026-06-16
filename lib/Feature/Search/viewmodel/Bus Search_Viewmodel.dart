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
        frequency: '15 minutes',
      ),
      BusRouteModel(
        fromcity: 'Patiala',
        tocity: 'Sangrur',
        startingprice: 700,
        reviews: 3,
        totalreviwews: 100,
        frequency: '1 Hour',
      ),
      BusRouteModel(
        fromcity: 'Jhlandhar',
        tocity: 'chandigarh',
        startingprice: 500,
        reviews: 5,
        totalreviwews: 4.9,
        frequency: '35 minutes',
      ),
      BusRouteModel(
        fromcity: 'Chandigarh',
        tocity: 'Sangrur',
        startingprice: 399,
        reviews: 4,
        totalreviwews: 3.76,
        frequency: '3 Hours',
      ),
      BusRouteModel(
        fromcity: 'Sangrur',
        tocity: 'Patiala',
        startingprice: 700,
        reviews: 3,
        totalreviwews: 1.00,
        frequency: 'Weekly',
      ),
      BusRouteModel(
        fromcity: 'Jhlandhar',
        tocity: 'Chandigarh',
        startingprice: 500,
        reviews: 5,
        totalreviwews: 4.00,
        frequency: '45 minutes',
      ),
    ];

    _isloading = false;
    notifyListeners();
  }
}
