import 'package:flutter/material.dart';
import 'package:thechef/models/category.dart';
import 'package:http/http.dart' as http;



Container carouselContainer() {
  return Container(
    height: 200,
    //decoration: Decoration(BoxDecoration(border: Border())),
    child: FutureBuilder<List<Category>>(
      future: fetchResponse(http.Client()),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);
        return snapshot.hasData ? CarouselList(slides: snapshot.data) : Center(child: CircularProgressIndicator());
      },
    ),
  );
}

class CarouselList extends StatelessWidget {
  final List<Category> slides;

  CarouselList({Key key, this.slides}) : super(key: key);

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
                  Image.network(
                    slides[index].image,
                    height: 140,
                  ),
                  Container(
                    //decoration: myBoxDecoration(),
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      slides[index].title,
                      style: TextStyle(fontWeight: FontWeight.w700),
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