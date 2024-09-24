import 'package:flutter/material.dart';
import 'package:intern_app/features/details/widgets/download_button.dart';
import 'package:intern_app/features/details/widgets/html_rich_text.dart';
import 'package:intern_app/features/details/widgets/play_button.dart';

class DetailsScreen extends StatefulWidget {
  final Map<String, dynamic> show;
  const DetailsScreen({super.key, required this.show});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: widget.show['image'] == null
                      ? const AssetImage(
                          'assets/tv.jpeg',
                        )
                      : NetworkImage(
                          widget.show['image']['medium'],
                        ),
                ),
              ),
              height: 400,
              width: double.infinity,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.show['name'] ?? "Movie",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
            Row(
              children: [
                Text(
                  widget.show['premiered'].split('-')[0],
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                widget.show['rating']['average'] != null
                    ? Text(
                        " • ${widget.show['rating']['average'].toString()}",
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      )
                    : const SizedBox.shrink(),
                widget.show['language'] != null
                    ? Text(
                        " • ${widget.show['language']}",
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      )
                    : const SizedBox.shrink()
              ],
            ),
            Text(
              'Genres: ${widget.show['genres'].join(', ')}',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const PlayButton(),
            const SizedBox(
              height: 15,
            ),
            const DownloadButton(),
            const SizedBox(
              height: 25,
            ),
            HTMLRichText(
              htmlString: widget.show['summary'] ?? 'No summary available.',
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Similar Shows",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
