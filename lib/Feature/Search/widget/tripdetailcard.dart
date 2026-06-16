import 'package:busapp/Feature/Search/viewmodel/Bus%20Search_Viewmodel.dart';
import 'package:busapp/Feature/Search/widget/Searchdelegate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Tripdetailcard extends StatelessWidget {
  const Tripdetailcard({super.key});

  @override
  Widget build(BuildContext context) {
    final viewhome = context.watch<Bussearchviewmodel>();
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Trip Details",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),

            TextFormField(
              readOnly: true,
              controller: TextEditingController(text: viewhome.fromcity),
              onTap: () async {
                final city = await showSearch<String>(
                  context: context,
                  delegate: CitySearchdelgate(viewhome.citylist),
                );

                if (city != null && city.isNotEmpty) {
                  viewhome.setfromcity(city);
                }
              },
              decoration: InputDecoration(
                labelText: "Current City",
                prefixIcon: const Icon(Icons.location_on, color: Colors.blue),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              readOnly: true,
              controller: TextEditingController(text: viewhome.tocity),
              onTap: () async {
                final city = await showSearch<String>(
                  context: context,
                  delegate: CitySearchdelgate(viewhome.citylist),
                );

                if (city != null && city.isNotEmpty) {
                  viewhome.settocity(city);
                }
              },
              decoration: InputDecoration(
                labelText: "Destination",
                prefixIcon: const Icon(Icons.route, color: Colors.blue),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: ["Sleeper", "AC", "Express"].map((type) {
                final isSelected = viewhome.selectbustype == type;

                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: ChoiceChip(
                      label: Text(type),
                      selected: isSelected,
                      selectedColor: Colors.blue,
                      backgroundColor: Colors.grey.shade200,
                      labelStyle: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                      onSelected: (_) {
                        viewhome.selectBusType(type);
                      },
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),

            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue,
              ),
              child: Center(
                child: Text(
                  'Search buses',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
