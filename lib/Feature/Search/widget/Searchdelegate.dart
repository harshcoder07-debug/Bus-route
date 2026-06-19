import 'package:flutter/material.dart';

class CitySearchdelgate extends SearchDelegate<String> {
  final List<String> cities;
  CitySearchdelgate(this.cities);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          close(context, '');
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, '');
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = cities
        .where((city) => city.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsetsGeometry.all(6),
          child: ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(10),
            ),
            leading: Icon(
              Icons.location_city,
              color: const Color.fromARGB(255, 247, 244, 244),
            ),
            tileColor: const Color.fromARGB(255, 118, 135, 233),
            title: Text(
              suggestions[index],
              style: TextStyle(color: const Color.fromARGB(255, 17, 16, 16)),
            ),
            onTap: () => close(context, suggestions[index]),
          ),
        );
      },
    );
  }
}
