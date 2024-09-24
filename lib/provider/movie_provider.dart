import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MovieProvider with ChangeNotifier {
  List<dynamic> _shows = [];

  List<dynamic> get shows => _shows;

  Future<void> fetchShows() async {
    const url = 'https://api.tvmaze.com/search/shows?q=All';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        _shows = data;
        notifyListeners(); 
      } else {
        throw Exception('Failed to load shows');
      }
    } catch (error) {
      print(error);
    }
  }
}
