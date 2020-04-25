import 'package:flutter/material.dart';
import 'package:thechef/widgets/carousel.dart';

void main() => runApp(TheChef());

class TheChef extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TheChef',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Сервіс для пошуку Кухарів'),
        backgroundColor: Colors.amberAccent,
      ),
      body: ListView(scrollDirection: Axis.vertical, children: <Widget>[
        Container(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: Text(
            'Популярні категорії',
            style: TextStyle(fontSize: 22.0, fontFamily: 'Pacifico'),
          )),
        ),
        carouselContainer(CarouselParameters(url: 'https://the-chef.co/?get-categories', circle: false, containerWidth: 180, titleAlign: Alignment.center)),
        Container(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: Text(
            'Наші кухарі',
            style: TextStyle(fontSize: 22.0, fontFamily: 'Pacifico'),
          )),
        ),
        carouselContainer(CarouselParameters(url: 'https://the-chef.co/?get-chefs', circle: true, containerWidth: 150, titleAlign: Alignment.center)),
        Container(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: Text(
            'Радимо спробувати',
            style: TextStyle(fontSize: 22.0, fontFamily: 'Pacifico'),
          )),
        ),
        carouselContainer(CarouselParameters(url: 'https://the-chef.co/?get-services', circle: false, containerWidth: 180, titleAlign: Alignment.center)),
      ]),
    );
  }
}
