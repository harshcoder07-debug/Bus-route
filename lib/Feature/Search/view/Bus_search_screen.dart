// ignore_for_file: unused_import, unnecessary_const

import 'package:busapp/Feature/Search/viewmodel/Bus Search_Viewmodel.dart';
import 'package:busapp/Feature/Search/widget/tripdetailcard.dart';
import 'package:busapp/Feature/routes/popular_route_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Bussearchscreen extends StatefulWidget {
  const Bussearchscreen({super.key});

  @override
  State<Bussearchscreen> createState() => _BussearchscreenState();
}

class _BussearchscreenState extends State<Bussearchscreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<Bussearchviewmodel>().popularroutelist();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Check if the user has selected cities to search yet

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),

          const Center(
            child: const Text(
              "Travel Across Punjab",
              style: TextStyle(
                fontSize: 20,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const Center(
            child: Text("Reliable, punctual, and safe journeys daily."),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [Tripdetailcard()],
            ),
          ),
          const SizedBox(height: 10),

          Expanded(
            child: Consumer<Bussearchviewmodel>(
              builder: (context, vm, _) {
                final routes = vm.filterroute;

                if (vm.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (routes.isEmpty) {
                  return const Center(child: Text("No buses found"));
                }

                return ListView.builder(
                  itemCount: routes.length,
                  itemBuilder: (context, index) {
                    final r = routes[index];

                    return Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      child: Container(
                        height: 140,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${r.fromcity} ➔ ${r.tocity}",
                              style: TextStyle(fontSize: 17),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Frequency: ${r.frequency}",
                                  style: TextStyle(fontSize: 15),
                                ),
                                Text(
                                  "Satrting Price: ${r.startingprice}",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                            Text(
                              "Bus Type: ${r.Bustype}",
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
