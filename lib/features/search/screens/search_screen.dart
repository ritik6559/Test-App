import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:intern_app/features/home/widgets/movie_tile.dart';
import 'package:intern_app/utils/show_snackbar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _searchTerm = '';
  List<dynamic> _searchResults = [];

  Future<void> _handleSearch() async {
    try {
      final response = await http.get(
        Uri.parse('https://api.tvmaze.com/search/shows?q=$_searchTerm'),
      );
      if (response.statusCode == 200) {
        setState(() {
          _searchResults = json.decode(response.body);
        });
      } else {
        showSnackBar(
          context,
          'Error fetching search results: ${response.statusCode}',
        );
      }
    } catch (e) {
      showSnackBar(
        context,
        'Error fetching search results: $e',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    _searchTerm = value;
                  });
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter Movie name";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: _handleSearch,
                    icon: const Icon(
                      Icons.search,
                    ),
                  ),
                  hintText: "Search....",
                  fillColor: Colors.grey.shade900,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: _searchResults.length,
                  itemBuilder: (context, index) {
                    final show = _searchResults[index]['show'];
                    return MovieTile(
                      show: show,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
