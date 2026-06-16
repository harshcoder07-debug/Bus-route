import 'package:busapp/Feature/Search/view/Bus_search_screen.dart';
import 'package:busapp/Feature/TimeTable/Shedule.dart';
import 'package:busapp/Feature/home/Viewmodel/DestinationViewModel.dart';
import 'package:busapp/Feature/home/Viewmodel/homeviewmodel.dart';
import 'package:busapp/Feature/home/Widget/Appbar.dart';
import 'package:busapp/Feature/home/Widget/Destination_card.dart';
import 'package:busapp/Feature/home/Widget/chip.dart';
import 'package:busapp/Feature/profile/profile.dart' show Profile;
import 'package:busapp/Feature/routes/popular_route_list.dart';
import 'package:flutter/material.dart' hide Route;
import 'package:provider/provider.dart';

class Homeview extends StatefulWidget {
  const Homeview({super.key});

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  int _selectedIndex = 0;
  final titles = ["Explore", "Search", "Routes", "Destination", "Profile"];
  final List<Widget> pages = [
    HomescreenContent(),
    const Bussearchscreen(),
    const PopularRouteList(),
    const Shedule(),

    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    final icons = [
      Icons.notifications,
      Icons.search,
      Icons.filter_list,
      Icons.map,
      Icons.settings,
    ];
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: titles[_selectedIndex],
            centerTitle: true,
            iconlogo: icons[_selectedIndex],
            icontap: () {
              context.read<Homeviewmodel>().onAppBarIconTap(
                _selectedIndex,
                context,
              );
            },
          ),

          Expanded(
            child: IndexedStack(index: _selectedIndex, children: pages),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(20),
        ),
        child: ClipRRect(
          borderRadius: BorderRadiusGeometry.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 0),
            child: BottomNavigationBar(
              backgroundColor: const Color.fromARGB(255, 78, 76, 240),
              currentIndex: _selectedIndex,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.white,
              unselectedItemColor: const Color.fromARGB(255, 255, 255, 255),

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
                    child: const Icon(Icons.home),
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
                    child: const Icon(Icons.home, color: Colors.white),
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Search",
                  icon: Container(
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: const Icon(Icons.search),
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
                    child: const Icon(Icons.search, color: Colors.white),
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Route",
                  icon: Container(
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: const Icon(Icons.timeline_rounded),
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
                    child: const Icon(
                      Icons.timeline_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Destination",
                  icon: Container(
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: const Icon(Icons.map_outlined),
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
                    child: const Icon(Icons.map, color: Colors.white),
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Profile",
                  icon: Container(
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: const Icon(Icons.person_2),
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
                    child: const Icon(Icons.person_2, color: Colors.white),
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
    final vm = context.watch<DestinationViewModel>();

    return ListView(
      padding: EdgeInsets.all(0),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 180,
            width: 120,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            child: Stack(
              fit: StackFit.expand,
              alignment: AlignmentGeometry.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    "asset/image/golden.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '''Discover the Spirit of Punjab''',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        '''From the serenity of Amritsar to the
modernist geometry of Chandigarh,
explore the heart of Northern India.''',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        //categiries chip strart here
        Consumer<Homeviewmodel>(
          builder: (context, vm, child) {
            return SizedBox(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CategoryChip(
                      title: vm.categories[index],
                      isSelected: vm.selectedChip == index,
                      onTap: () {
                        vm.selectIndex(index);
                      },
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(width: 10),
                  itemCount: vm.categories.length,
                ),
              ),
            );
          },
        ),

        ...vm.destinations.map(
          (destination) => Route(destination: destination),
        ),
      ],
    );
  }
}
