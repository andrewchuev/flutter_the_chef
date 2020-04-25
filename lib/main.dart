import 'package:flutter/material.dart';
import 'package:thechef/models/category.dart';
import 'package:thechef/widgets/carousel.dart';
import 'package:http/http.dart' as http;

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
          child: Center(child: Text('Популярні категорії', style: TextStyle(fontSize: 22.0, fontFamily: 'Pacifico'),)),
        ),
        Container(
          height: 200,
          //decoration: Decoration(BoxDecoration(border: Border())),
          child: FutureBuilder<List<Category>>(
            future: fetchCategories(http.Client()),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              return snapshot.hasData ? PhotosList(categories: snapshot.data) : Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ]),
    );
  }
}

/*
/*child: ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text('Популярні категорії', style: TextStyle(fontSize: 22.0, fontFamily: 'Pacifico'),)),
                    ),
                    carousel()
                  ],*/
 */
