import 'package:flutter/material.dart';
import 'package:plant/data/plant_data.dart'; // Import plant data

class FavouritePage extends StatelessWidget {
  final List<int> favorites;

  FavouritePage({Key? key, required this.favorites}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Filter plants that are marked as favorites
    final favoritePlants = plants.where((plant) => favorites.contains(plant.id)).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Plants'),
        backgroundColor: Colors.green,
      ),
      body: favoritePlants.isEmpty
          ? const Center(
        child: Text('No favorite plants yet!'),
      )
          : ListView.builder(
        itemCount: favoritePlants.length,
        itemBuilder: (context, index) {
          final plant = favoritePlants[index];
          return ListTile(
            leading: Image.asset(plant.imagePath, width: 50),
            title: Text(plant.name),
            subtitle: Text(plant.description),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                // Remove from favorites
                Navigator.pop(context, plant.id);
              },
            ),
          );
        },
      ),
    );
  }
}
