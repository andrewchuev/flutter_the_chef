import 'package:flutter/material.dart';
import 'package:thechef/models/category.dart';

BoxDecoration myBoxDecoration() {
  return BoxDecoration(
    border: Border.all(),
  );
}

class PhotosList extends StatelessWidget {
  final List<Category> categories;

  PhotosList({Key key, this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return Card(
          child: Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Image.network(
                    categories[index].image,
                    height: 150,
                  ),
                  Container(
                    decoration: myBoxDecoration(),
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      categories[index].title,
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
