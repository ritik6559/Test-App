import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intern_app/features/home/widgets/continue_watching_tile.dart';
import 'package:intern_app/features/home/widgets/movie_tile.dart';
import 'package:intern_app/features/home/widgets/previews.dart';
import 'package:intern_app/utils/show_snackbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> shows = [];
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchShows();
  }

  Future<void> fetchShows() async {
    setState(() {
      isLoading = true;
      errorMessage = '';
    });

    try {
      final response = await http
          .get(Uri.parse('https://api.tvmaze.com/search/shows?q=all'))
          .timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        setState(() {
          shows = json.decode(response.body);
          isLoading = false;
        });
      } else {
        throw Exception(
          'Failed to load shows: ${response.statusCode}',
        );
      }
    } on SocketException catch (_) {
      showSnackBar(
        context,
        'Network error: Please check your internet connection.',
      );
    } on TimeoutException catch (_) {
      showSnackBar(
        context,
        'Connection timed out. Please try again.',
      );
    } catch (e) {
      showSnackBar(
        context,
        'An unexpected error occurred: $e',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "For you!",
          style: TextStyle(
            fontSize: 22,
          ),
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : errorMessage.isNotEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(errorMessage),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: fetchShows,
                        child: const Text(
                          'Retry',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ContinueWatchingTile(
                        show: shows[0]['show'],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Previews",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Previews(
                        shows: shows,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Browse Shows",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 480,
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 0.7,
                          ),
                          itemCount: shows.length,
                          itemBuilder: (context, index) {
                            final show = shows[index]['show'];
                            return MovieTile(
                              show: show,
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
    );
  }
}
