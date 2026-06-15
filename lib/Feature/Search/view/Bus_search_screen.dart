// ignore_for_file: unnecessary_const

import 'package:busapp/Feature/Search/viewmodel/Bus Search_Viewmodel.dart';
import 'package:busapp/Feature/Search/widget/popular_route_list.dart';
import 'package:busapp/Feature/Search/widget/tripdetailcard.dart';
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
    return Scaffold(
      body: SingleChildScrollView(
        child: const Column(
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

            Center(child: Text("Reliable, punctual, and safe journeys daily.")),

            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Tripdetailcard(),

                  Text(
                    "Pupular Routes",
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "Most traveled destinations this week",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),

            const PopularRouteList(),
          ],
        ),
      ),
    );
  }
}
