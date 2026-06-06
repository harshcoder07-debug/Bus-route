import 'package:flutter/material.dart';

class Othersignincard extends StatelessWidget {
  final String imagePath;
  final String logname;
  final VoidCallback otherlogintap;
  const Othersignincard({
    super.key,
    required this.imagePath,
    required this.logname,
    required this.otherlogintap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: otherlogintap,
      child: Container(
        height: 40,
        width: 130,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, height: 24),
            const SizedBox(width: 8),
            Text(logname),
          ],
        ),
      ),
    );
  }
}
