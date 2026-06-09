import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final List<Widget>? actions;
  final bool centerTitle;
  final Color backgroundColor;
  final Icon? iconlogo;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.centerTitle = true,
    this.backgroundColor = const Color.fromARGB(255, 4, 8, 238),
    this.iconlogo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      height: 100,
      width: double.infinity,
      child: Row(children: [Text(title)]),
    );
  }
}
