import 'package:flutter/material.dart';
import 'package:movie_app_flutter/utils/text.dart';
import 'package:movie_app_flutter/widgets/toprated.dart';
import 'package:movie_app_flutter/widgets/trending.dart';
import 'package:movie_app_flutter/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.green),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String apikey = 'cb40507c04606dd6f40677b99804e124'; //API KEY MU
  final String readaccesstoken = //WAJIB
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjYjQwNTA3YzA0NjA2ZGQ2ZjQwNjc3Yjk5ODA0ZTEyNCIsInN1YiI6IjYzYTAzMWI0OGRkYzM0MTQ5NjljMzEyZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ._c0ZrXMcngi84LRMo_GCHyGurgNDRWS4dko6OJhTL_Q';
  List trendingmovies = [];
  List trendingmovies2 = [];
  List topratedmovies = [];
  List topratedmovies2 = [];
  List tv = [];

  @override
  void initState() {
    super.initState();
    loadmovies();
  }

  loadmovies() async {
    TMDB tmdbapi = TMDB(
      ApiKeys(apikey, readaccesstoken),
      logConfig: ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );

    Map trendingresult = await tmdbapi.v3.trending.getTrending();
    Map trendingresult2 = await tmdbapi.v3.trending.getTrending(page: 2);
    Map topratedresult = await tmdbapi.v3.movies.getTopRated(page: 1);
    Map topratedresult2 = await tmdbapi.v3.movies.getTopRated(page: 2);
    Map tvresult = await tmdbapi.v3.tv.getPopular();
    print((topratedresult));
    setState(() {
      trendingmovies = trendingresult['results'];
      trendingmovies2 = trendingresult2['results'];
      topratedmovies = topratedresult['results'];
      topratedmovies2 = topratedresult2['results'];

      tv = tvresult['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          //title: modified_text(text: 'Movie Daily'),
          title: Text(
            'Movie Daily',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: ListView(
          children: [
            TrendingMovies(
              trending: trendingmovies,
              trending2: trendingmovies2,
            ),
            TopRatedMovies(
              toprated: topratedmovies,
              toprated2: topratedmovies2,
            ),
            TV(tv: tv),
          ],
        ));
  }
}
