import 'package:flutter/material.dart';
import 'package:movie_app_flutter/utils/text.dart';

import '../description.dart';

class TrendingMovies extends StatelessWidget {
  final List trending, trending2;

  const TrendingMovies({Key key, this.trending, this.trending2})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // modified_text(
          //   text: 'Trending Movies',
          //   size: 26,
          // ),
          Text(
            'Trending',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
          ),
          SizedBox(height: 10),
          Text(
            'Yang Trending Trending Aja',
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 30),
          Container(
              height: 300,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: trending.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Description(
                                      name: trending[index]['title'],
                                      bannerurl:
                                          'https://image.tmdb.org/t/p/w500' +
                                              trending[index]['backdrop_path'],
                                      posterurl:
                                          'https://image.tmdb.org/t/p/w500' +
                                              trending[index]['poster_path'],
                                      description: trending[index]['overview'],
                                      vote: trending[index]['vote_average']
                                          .toString(),
                                      popularity: trending[index]['popularity']
                                          .toString(),
                                      launch: trending[index]['release_date'],
                                    )));
                      },
                      child: Container(
                        width: 180,
                        height: 1000,
                        child: Column(
                          children: [
                            Container(
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            'https://image.tmdb.org/t/p/w500' +
                                                trending[index]['poster_path']),
                                      ),
                                    ),
                                    height: 250,
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    child: modified_text(
                                        size: 15,
                                        text: trending[index]['title'] != null
                                            ? trending[index]['title']
                                            : 'Loading'),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  })),
          Container(
              height: 300,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: trending2.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Description(
                                      name: trending2[index]['title'],
                                      bannerurl:
                                          'https://image.tmdb.org/t/p/w500' +
                                              trending2[index]['backdrop_path'],
                                      posterurl:
                                          'https://image.tmdb.org/t/p/w500' +
                                              trending2[index]['poster_path'],
                                      description: trending2[index]['overview'],
                                      vote: trending2[index]['vote_average']
                                          .toString(),
                                      popularity: trending2[index]['popularity']
                                          .toString(),
                                      launch: trending2[index]['release_date'],
                                    )));
                      },
                      child: Container(
                        width: 180,
                        height: 1000,
                        child: Column(
                          children: [
                            Container(
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            'https://image.tmdb.org/t/p/w500' +
                                                trending2[index]
                                                    ['poster_path']),
                                      ),
                                    ),
                                    height: 250,
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    child: modified_text(
                                        size: 15,
                                        text: trending2[index]['title'] != null
                                            ? trending2[index]['title']
                                            : 'Loading'),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
