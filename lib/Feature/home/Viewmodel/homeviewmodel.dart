import 'package:flutter/material.dart';

class Homeviewmodel extends ChangeNotifier {
  int selectedChip = 0;

  final List<String> categories = [
    "All Spots",
    "Trip Location",
    "Modern Places",
    "Summer Special",
    "Long Trip",
  ];

  void selectIndex(int index) {
    selectedChip = index;
    notifyListeners();
  }

  void onAppBarIconTap(int selectedIndex, BuildContext context) {
    switch (selectedIndex) {
      case 0:
        print("Notifications");
        break;

      case 1:
        print("Schedule");
        break;

      case 2:
        print("Search Filter");
        break;

      case 3:
        print("Map");
        break;

      case 4:
        print("Settings");
        break;
    }
  }
}
