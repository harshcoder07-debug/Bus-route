import 'package:busapp/Feature/Search/viewmodel/Bus%20Search_Viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PopularRouteList extends StatelessWidget {
  const PopularRouteList({super.key});

  @override
  Widget build(BuildContext context) {
    final viewhome = context.watch<Bussearchviewmodel>();

    return ListView.separated(
      padding: EdgeInsets.all(0),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: viewhome.popularRoutes.length,
      separatorBuilder: (_, _) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final viewroutr = viewhome.popularRoutes[index];
        return Container(
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 240, 240, 247),
            borderRadius: BorderRadius.circular(12),
          ),
          height: 150,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: EdgeInsetsGeometry.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    viewroutr.fromcity,
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontSize: 18,
                    ),
                  ),

                  Row(
                    children: [
                      Icon(Icons.arrow_forward),
                      Text(viewroutr.tocity),
                      // Text(
                      //   viewroutr.startingprice.toString(),
                      //   style: TextStyle(color: Colors.white),
                      // ),
                    ],
                  ),
                  Text(
                    "⭐${viewroutr.reviews}  ${(viewroutr.totalreviwews.toString())}k Reviews",
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
