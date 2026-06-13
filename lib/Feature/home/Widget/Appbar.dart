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
      color: backgroundColor,
      height: 80,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset("asset/image/bus.png", height: 24),
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
          IconButton(
            onPressed: () {
              icontap();
            },
            icon: Icon(iconlogo, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
