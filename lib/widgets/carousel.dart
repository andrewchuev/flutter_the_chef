import 'package:flutter/material.dart';
import 'package:thechef/models/category.dart';
import 'package:http/http.dart' as http;

class CarouselParameters {
  String url = '';
  bool circle = false;
  double containerWidth = 180.0;
  Alignment titleAlign = Alignment.centerLeft;

  CarouselParameters({this.url, this.circle, this.containerWidth, this.titleAlign});
}

Container carouselContainer(CarouselParameters parameters) {
  return Container(
    height: parameters.containerWidth,
//    decoration: myBoxDecoration(),
    child: FutureBuilder<List<CarouselSlide>>(
      future: fetchResponse(http.Client(), parameters.url),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);
        return snapshot.hasData
            ? CarouselList(
                slides: snapshot.data,
                circle: parameters.circle,
                titleAlign: parameters.titleAlign,
              )
            : Center(child: CircularProgressIndicator());
      },
    ),
  );
}

class CarouselList extends StatelessWidget {
  List<CarouselSlide> slides;
  bool circle;
  Alignment titleAlign = Alignment.centerLeft;

  CarouselList({Key key, this.slides, this.circle, this.titleAlign}) : super(key: key);

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
                      alignment: titleAlign,
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
