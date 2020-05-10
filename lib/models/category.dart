import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class CarouselSlide {
  final int id;
  final String title;
  final String image;
  final String description;

  CarouselSlide({this.id, this.title, this.image, this.description});

  factory CarouselSlide.fromJson(Map<String, dynamic> json) {
    return CarouselSlide(
      id: json['id'] as int,
      title: json['title'] as String,
      image: json['image'] as String,
      description: json['description'] as String,
    );
  }
}

Future<List<CarouselSlide>> fetchResponse(http.Client client, String url) async {
  final response = await client.get(url);
  return compute(parseResponse, response.body);
}

List<CarouselSlide> parseResponse(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  //print(parsed);
  return parsed.map<CarouselSlide>((json) => CarouselSlide.fromJson(json)).toList();
}


