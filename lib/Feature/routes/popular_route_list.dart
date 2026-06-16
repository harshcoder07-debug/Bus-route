import 'package:busapp/Feature/Search/viewmodel/Bus%20Search_Viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PopularRouteList extends StatelessWidget {
  const PopularRouteList({super.key});

  @override
  Widget build(BuildContext context) {
    final viewHome = context.watch<Bussearchviewmodel>();

    return ListView.separated(
      padding: EdgeInsets.all(0),
      itemCount: viewHome.popularRoutes.length,
      separatorBuilder: (_, _) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final route = viewHome.popularRoutes[index];

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 237, 239, 241),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Route
              Row(
                children: [
                  Expanded(
                    child: Text(
                      route.fromcity,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                    ),
                  ),

                  const Icon(
                    Icons.arrow_forward_rounded,
                    color: Color.fromARGB(255, 10, 10, 10),
                  ),

                  Expanded(
                    child: Text(
                      route.tocity,
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              /// Price
              Text(
                "Starting from ₹${route.startingprice}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 8),

              /// Reviews
              Text(
                "⭐ ${route.reviews} (${route.totalreviwews}K Reviews)",
                style: const TextStyle(color: Colors.black54),
              ),

              const SizedBox(height: 12),

              /// Frequency Chip
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  route.frequency,
                  style: const TextStyle(
                    color: Colors.indigo,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
