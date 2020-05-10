import 'package:flutter/material.dart';
import 'package:thechef/screens/category-listtile.dart';
import 'package:thechef/screens/chefs-listtile.dart';
import 'package:thechef/widgets/app-bar.dart';
import 'package:thechef/widgets/carousel.dart';

void main() => runApp(TheChef());

class TheChef extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TheChef',
      debugShowCheckedModeBanner: false,
      /*home: Scaffold(
        body: CategoryListTile(),
      ),*/
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: ListView(scrollDirection: Axis.vertical, children: <Widget>[
        Container(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: Text(
            'Популярні категорії',
            style: TextStyle(fontSize: 22.0, fontFamily: 'Pacifico'),
          )),
        ),
        carouselContainer(CarouselParameters(url: 'https://the-chef.co/?get-categories', circle: false, containerWidth: 170, titleAlign: Alignment.center, imageHeight: 120.0)),
        Container(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: Text(
            'Наші кухарі',
            style: TextStyle(fontSize: 22.0, fontFamily: 'Pacifico'),
          )),
        ),
        carouselContainer(CarouselParameters(url: 'https://the-chef.co/?get-chefs', circle: true, containerWidth: 140, titleAlign: Alignment.center, imageHeight: 120.0)),
        Container(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: Text(
            'Радимо спробувати',
            style: TextStyle(fontSize: 22.0, fontFamily: 'Pacifico'),
          )),
        ),
        carouselContainer(CarouselParameters(url: 'https://the-chef.co/?get-services', circle: false, containerWidth: 180, titleAlign: Alignment.center, imageHeight: 130.0)),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Головна'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text('Мої запити'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Пошук'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      switch (index) {
        case 1:
          {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CategoryListTile()),
            );
          }
          break;
        case 2:
          {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChefListTile()),
            );
          }
          break;
        default:
          {
            print("0");
          }
          break;
      }
    });
  }
}
