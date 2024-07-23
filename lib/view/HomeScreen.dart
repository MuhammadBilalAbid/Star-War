import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:star_wars/provider/CharacterProvider.dart';
import 'package:star_wars/view/CharacterDetails.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CharacterProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Star Wars Characters"),
          ),
          body: provider.isLoading
              ? const Center(child: CircularProgressIndicator())
              : GridView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  itemCount: provider.character.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio: 0.8,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    final character = provider.character[index];
                    return LayoutBuilder(
                      builder: (context, constraints) {
                        final double containerHeight = constraints.maxHeight;
                        final double coloredSectionHeight =
                            containerHeight * 0.2;
                        final double remainingHeight =
                            containerHeight - coloredSectionHeight;
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CharacterDetails(
                                  character: character,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0, 2),
                                  blurRadius: 4.0,
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/images/profile.png",
                                  height: remainingHeight * 0.968,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(height: 5),
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFeeedf2),
                                    borderRadius: BorderRadius.vertical(
                                      bottom: Radius.circular(8.0),
                                    ),
                                  ),
                                  height: coloredSectionHeight,
                                  child: Center(
                                    child: Text(
                                      character.name,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
        );
      },
    );
  }
}
