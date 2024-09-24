import 'package:flutter/material.dart';
import 'package:intern_app/features/details/screens/details_screen.dart';

class MovieTile extends StatelessWidget {
  final Map<String, dynamic> show;
  const MovieTile({super.key, required this.show});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailsScreen(
              show: show,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        height: 500,
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 220,
              width: double.infinity,
              child: show['image'] == null
                  ? Image.asset('assets/tv.jpeg')
                  : Image.network(
                      show['image']['medium'],
                      fit: BoxFit.contain,
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
