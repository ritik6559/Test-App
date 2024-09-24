import 'package:flutter/cupertino.dart';

class Previews extends StatelessWidget {
  final List<dynamic> shows;
  const Previews({super.key, required this.shows});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        height: 150,
        width: double.infinity,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: shows.length,
          itemBuilder: (context, index) {
            final show = shows[index]['show'];
            return Container(
              height: 100,
              width: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: show['image'] == null
                      ? const AssetImage('assets/tv.jpeg')
                      : NetworkImage(show['image']['medium']),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
