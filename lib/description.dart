import 'package:flutter/material.dart';
import 'package:movie_app_flutter/utils/text.dart';

class Description extends StatelessWidget {
  final String name,
      description,
      bannerurl,
      posterurl,
      vote,
      popularity,
      launch; //launch_on;

  const Description(
      {Key key,
      this.name,
      this.description,
      this.bannerurl,
      this.posterurl,
      this.vote,
      this.popularity,
      this.launch})
      : super(key: key);
  //this.launch_on
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(children: [
          Container(
              height: 250,
              child: Stack(children: [
                Positioned(
                  child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      bannerurl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                    bottom: 10,
                    child: Text(
                      '⭐ Rating - ' + vote,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                          shadows: <Shadow>[
                            Shadow(blurRadius: 10, color: Colors.black),
                            Shadow(blurRadius: 20, color: Colors.black),
                            Shadow(blurRadius: 20, color: Colors.black),
                          ]),
                    )),
              ])),
          SizedBox(height: 15),
          Container(
              padding: EdgeInsets.all(10),
              child: modified_text(
                  text: name != null ? name : 'Title Gagal Didapat', size: 24)),
          Container(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Text('Tanggal Rilis '),
                  Text(launch != null ? launch : ' tidak diketahui')
                ],
              )),
          Row(
            children: [
              Container(
                height: 200,
                width: 100,
                child: Image.network(posterurl),
              ),
              Flexible(
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: modified_text(text: description, size: 18)),
              ),
            ],
          ),
          SizedBox(height: 15),
          Column(
            children: [
              Text('Skor Popularitas',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              SizedBox(height: 25),
              Text(popularity,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50))
            ],
          )
        ]),
      ),
    );
  }
}
//style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50)
