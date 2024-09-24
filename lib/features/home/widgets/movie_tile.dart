import 'package:flutter/material.dart';

class MovieTile extends StatelessWidget {
  final Map<String, dynamic> show;
  const MovieTile({super.key, required this.show});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 400,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 250,
              width: double.infinity,
              child: show['image'] == null
                  ? Image.asset('assets/tv.jpeg')
                  : Image.network(
                      show['image']['medium'],
                      fit: BoxFit.cover,
                    ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              show['name'] ?? "Movie",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
