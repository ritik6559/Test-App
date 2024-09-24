import 'package:flutter/material.dart';

class HTMLRichText extends StatelessWidget {
  final String htmlString;


  const HTMLRichText({super.key, required this.htmlString});

  List<TextSpan> _parseHTML(String input) {
    List<TextSpan> spans = [];
    RegExp exp = RegExp(r"<b>(.*?)</b>|<p>(.*?)</p>|([^<>]+)", dotAll: true);

    String processedInput = input.replaceAll(
      RegExp(r"</?p>"),
      "",
    );

    Iterable<Match> matches = exp.allMatches(processedInput);

    for (Match match in matches) {
      if (match.group(1) != null) {
        spans.add(
          TextSpan(
            text: match.group(1),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      } else if (match.group(2) != null) {
        spans.add(TextSpan(text: match.group(2)));
      } else if (match.group(3) != null) {
        spans.add(TextSpan(text: match.group(3)));
      }
    }

    return spans;
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 17,
        ),
        children: _parseHTML(htmlString),
      ),
    );
  }
}
