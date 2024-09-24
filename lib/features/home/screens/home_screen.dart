import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intern_app/features/home/widgets/continue_watching_tile.dart';
import 'package:intern_app/features/home/widgets/movie_tile.dart';
import 'package:intern_app/features/home/widgets/previews.dart';

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
          .timeout(Duration(seconds: 10));
      if (response.statusCode == 200) {
        setState(() {
          shows = json.decode(response.body);
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load shows: ${response.statusCode}');
      }
    } on SocketException catch (e) {
      setState(() {
        errorMessage = 'Network error: Please check your internet connection.';
        isLoading = false;
      });
    } on TimeoutException catch (e) {
      setState(() {
        errorMessage = 'Connection timed out. Please try again.';
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = 'An unexpected error occurred: $e';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 400, 
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 0.7,
                          ),
                          itemCount:
                              shows.length, 
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
