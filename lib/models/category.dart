import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Category {
  final int id;
  final String title;
  final String image;

  Category({this.id, this.title, this.image});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] as int,
      title: json['title'] as String,
      image: json['image'] as String,
    );
  }
}

Future<List<Category>> fetchCategories(http.Client client) async {
  final response = await client.get('https://the-chef.co/?get-categories');
  return compute(parseCategories, response.body);
}

List<Category> parseCategories(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  print(parsed);
  return parsed.map<Category>((json) => Category.fromJson(json)).toList();
}


