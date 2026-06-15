import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final titles = ["Explore", "Schedule", "Search", "Routes", "Profile"];
  final String title;
  final List<Widget>? actions;
  final bool centerTitle;
  final Color backgroundColor;
  final IconData iconlogo;
  final VoidCallback icontap;
  CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    required this.centerTitle,
    this.backgroundColor = const Color.fromARGB(255, 4, 8, 238),
    required this.iconlogo,
    required this.icontap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: backgroundColor,
      ),

      height: 70,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: const Color.fromARGB(255, 87, 102, 235),
                child: Image.asset("asset/image/bus.png", height: 24),
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 19,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          CircleAvatar(
            radius: 20,
            backgroundColor: const Color.fromARGB(255, 87, 102, 235),
            child: IconButton(
              onPressed: () {
                icontap();
              },
              icon: Icon(iconlogo, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
