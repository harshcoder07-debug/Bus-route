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
    final viewsearch = context.watch<Bussearchviewmodel>();

    // Check if the user has selected cities to search yet
    final hasSearched =
        viewsearch.fromcity.isNotEmpty && viewsearch.tocity.isNotEmpty;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),

            const Center(
              child: Text(
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

            // Show nothing on initial load, show "No bus found" only after an active search empty return
            if (viewsearch.filterroute.isEmpty && hasSearched)
              const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Text(
                    "No buses found for this route.",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ),
              )
            else if (viewsearch.filterroute.isNotEmpty)
              ListView.builder(
                itemCount: viewsearch.filterroute.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final searchview = viewsearch.filterroute[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 6,
                    ),
                    child: ListTile(
                      leading: const Icon(
                        Icons.directions_bus,
                        color: Colors.blue,
                      ),
                      title: Text(
                        "${searchview.fromcity} ➔ ${searchview.tocity}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text("Frequency: ${searchview.frequency}"),
                      trailing: Text(
                        "₹${searchview.startingprice}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
