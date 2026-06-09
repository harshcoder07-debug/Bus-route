import 'package:busapp/Feature/Search/Search.dart';
import 'package:busapp/Feature/TimeTable/Shedule.dart';
import 'package:busapp/Feature/profile/profile.dart' show Profile;
import 'package:busapp/Feature/routes/Destination.dart';
import 'package:flutter/material.dart';

class Homeview extends StatefulWidget {
  const Homeview({super.key});

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  int _selectedIndex = 0;

  final List<Widget> pages = const [
    HomescreenContent(),
    Shedule(),
    Search(),
    Destination(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: pages),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 202, 218, 215),
          borderRadius: BorderRadius.circular(20),
        ),
        child: ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(5),
          child: Padding(
            padding: const EdgeInsets.only(top: 2, bottom: 2),
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              currentIndex: _selectedIndex,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.black,

              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                  label: "Explore",
                  icon: Container(
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: Icon(Icons.home),
                  ),
                  activeIcon: Container(
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue,
                          blurRadius: 7,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Icon(Icons.home, color: Colors.white),
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Search",
                  icon: Container(
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: Icon(Icons.search),
                  ),
                  activeIcon: Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.4),
                          blurRadius: 12,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Icon(Icons.search, color: Colors.white),
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Route",
                  icon: Container(
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: Icon(Icons.timeline_rounded),
                  ),
                  activeIcon: Container(
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue,
                          blurRadius: 12,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Icon(Icons.timeline_rounded, color: Colors.white),
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Explore",
                  icon: Container(
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: Icon(Icons.map_outlined),
                  ),
                  activeIcon: Container(
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue,
                          blurRadius: 12,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Icon(Icons.map, color: Colors.white),
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Profile",
                  icon: Container(
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: Icon(Icons.person_2),
                  ),
                  activeIcon: Container(
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue,
                          blurRadius: 12,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Icon(Icons.person_2, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomescreenContent extends StatelessWidget {
  const HomescreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Welcom home content")));
  }
}
