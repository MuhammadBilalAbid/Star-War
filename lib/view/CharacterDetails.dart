import 'package:flutter/material.dart';

class CharacterDetails extends StatelessWidget {
  final character;

  const CharacterDetails({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text("Name: ${character.name}",
                style: const TextStyle(fontSize: 18)),
            Text("Height: ${character.height} cm",
                style: const TextStyle(fontSize: 18)),
            Text("Mass: ${character.mass} kg",
                style: const TextStyle(fontSize: 18)),
            Text("Hair Color: ${character.hairColor}",
                style: const TextStyle(fontSize: 18)),
            Text("Skin Color: ${character.skinColor}",
                style: const TextStyle(fontSize: 18)),
            Text("Eye Color: ${character.eyeColor}",
                style: const TextStyle(fontSize: 18)),
            Text("Birth Year: ${character.birthYear}",
                style: const TextStyle(fontSize: 18)),
            Text("Gender: ${character.gender}",
                style: const TextStyle(fontSize: 18)),
            Text("Homeworld: ${character.homeworld}",
                style: const TextStyle(fontSize: 18)),
            Text(
                "Films: ${character.films.isNotEmpty ? character.films.join(', ') : 'N/A'}",
                style: const TextStyle(fontSize: 18)),
            Text(
                "Species: ${character.species.isNotEmpty ? character.species.join(', ') : 'N/A'}",
                style: const TextStyle(fontSize: 18)),
            Text(
                "Vehicles: ${character.vehicles.isNotEmpty ? character.vehicles.join(', ') : 'N/A'}",
                style: const TextStyle(fontSize: 18)),
            Text(
                "Starships: ${character.starships.isNotEmpty ? character.starships.join(', ') : 'N/A'}",
                style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
