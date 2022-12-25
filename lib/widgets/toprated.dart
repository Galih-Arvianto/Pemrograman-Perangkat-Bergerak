import 'package:flutter/material.dart';
import 'package:movie_app_flutter/utils/text.dart';
import '../description.dart';

class TopRatedMovies extends StatelessWidget {
  final List toprated, toprated2;

  const TopRatedMovies({Key key, this.toprated, this.toprated2})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // modified_text(
          //   text: 'Top Rated Movies',
          //   size: 26,
          // )
          Text(
            'Top Rated',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Best of The Best',
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Container(
              height: 400,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: toprated.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Description(
                                      name: toprated[index]['title'],
                                      bannerurl:
                                          'https://image.tmdb.org/t/p/w500' +
                                              toprated[index]['backdrop_path'],
                                      posterurl:
                                          'https://image.tmdb.org/t/p/w500' +
                                              toprated[index]['poster_path'],
                                      description: toprated[index]['overview'],
                                      vote: toprated[index]['vote_average']
                                          .toString(),
                                      popularity: toprated[index]['popularity']
                                          .toString(),
                                      launch: toprated[index]['release_date'],
                                    )));
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        width: 180,
                        height: 400,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          toprated[index]['poster_path']),
                                ),
                              ),
                              height: 300,
                            ),
                            SizedBox(height: 5),
                            Container(
                              child: modified_text(
                                  size: 15,
                                  text: toprated[index]['title'] != null
                                      ? toprated[index]['title']
                                      : 'Loading'),
                            )
                          ],
                        ),
                      ),
                    );
                  })),
          Container(
              height: 400,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: toprated2.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Description(
                                      name: toprated2[index]['title'],
                                      bannerurl:
                                          'https://image.tmdb.org/t/p/w500' +
                                              toprated2[index]['backdrop_path'],
                                      posterurl:
                                          'https://image.tmdb.org/t/p/w500' +
                                              toprated2[index]['poster_path'],
                                      description: toprated2[index]['overview'],
                                      vote: toprated2[index]['vote_average']
                                          .toString(),
                                      popularity: toprated2[index]['popularity']
                                          .toString(),
                                      launch: toprated2[index]['release_date'],
                                    )));
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        width: 180,
                        height: 400,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          toprated2[index]['poster_path']),
                                ),
                              ),
                              height: 300,
                            ),
                            SizedBox(height: 5),
                            Container(
                              child: modified_text(
                                  size: 15,
                                  text: toprated2[index]['title'] != null
                                      ? toprated2[index]['title']
                                      : 'Loading'),
                            )
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
