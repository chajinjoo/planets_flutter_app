import 'package:flutter/material.dart';
import 'package:planets_flutter_app/ui/planet_summary.dart';
import 'package:planets_flutter_app/model/planets.dart';

class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) => PlanetSummary((planets[index])),
        itemCount: planets.length,
        padding: EdgeInsets.symmetric(vertical: 16.0),
      ),
    );
  }
}
