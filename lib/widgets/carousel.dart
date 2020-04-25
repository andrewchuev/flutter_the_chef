import 'package:flutter/material.dart';
import 'package:thechef/models/category.dart';
import 'package:http/http.dart' as http;

Container carouselContainer(String url, {bool circle = false}) {
  return Container(
    height: 180,
//    decoration: myBoxDecoration(),
    child: FutureBuilder<List<CarouselSlide>>(
      future: fetchResponse(http.Client(), url),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);
        return snapshot.hasData
            ? CarouselList(
                slides: snapshot.data,
                circle: circle,
              )
            : Center(child: CircularProgressIndicator());
      },
    ),
  );
}

class CarouselList extends StatelessWidget {
  final List<CarouselSlide> slides;
  final bool circle;

  CarouselList({Key key, this.slides, this.circle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: slides.length,
      itemBuilder: (context, index) {
        return Card(
          child: Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  circle
                      ? CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.transparent,
                          backgroundImage: NetworkImage("${slides[index].image}"),
                        )
                      : Image.network(
                          slides[index].image,
                          height: 130,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                  Container(
                    //decoration: myBoxDecoration(),
                    padding: const EdgeInsets.all(8.0),
                    width: 140,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        slides[index].title,
                        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 10.0),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

BoxDecoration myBoxDecoration() {
  return BoxDecoration(
    border: Border.all(),
  );
}
