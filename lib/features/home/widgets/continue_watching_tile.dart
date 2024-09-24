import 'package:flutter/material.dart';

class ContinueWatchingTile extends StatelessWidget {
  final Map<String,dynamic> show;
  const ContinueWatchingTile({super.key, required this.show});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 400,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              show['image']['original'],
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/test_logo.jpeg',
                height: 40,
              ),
              const Text(
                'TV shows',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              const Text(
                'Movies',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              const Text(
                'My list',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
