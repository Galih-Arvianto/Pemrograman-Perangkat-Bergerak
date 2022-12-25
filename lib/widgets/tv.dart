import 'package:flutter/material.dart';
import 'package:movie_app_flutter/utils/text.dart';
import '../description.dart';

class TV extends StatelessWidget {
  final List tv;

  const TV({Key key, this.tv}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // modified_text(
          //   text: 'Popular TV Shows',
          //   size: 26,
          // ),
          Text(
            'TV Show',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
          ),
          SizedBox(height: 10),
          Text(
            'Longer watch time',
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Container(
              // color: Colors.red,
              height: 300,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tv.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Description(
                                        name: tv[index]['original_name'],
                                        bannerurl:
                                            'https://image.tmdb.org/t/p/w500' +
                                                tv[index]['backdrop_path'],
                                        posterurl:
                                            'https://image.tmdb.org/t/p/w500' +
                                                tv[index]['poster_path'],
                                        description: tv[index]['overview'],
                                        vote: tv[index]['vote_average']
                                            .toString(),
                                        popularity:
                                            tv[index]['popularity'].toString(),
                                        launch: tv[index]['first_air_date'],
                                      )));
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          width: 300,
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'https://image.tmdb.org/t/p/w500' +
                                              tv[index]['backdrop_path']),
                                      fit: BoxFit.cover),
                                ),
                                height: 200,
                              ),
                              SizedBox(height: 5),
                              Container(
                                child: modified_text(
                                    size: 15,
                                    text: tv[index]['original_name'] != null
                                        ? tv[index]['original_name']
                                        : 'Loading'),
                              )
                            ],
                          ),
                        ));
                  }))
        ],
      ),
    );
  }
}
