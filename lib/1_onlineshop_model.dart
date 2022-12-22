import 'dart:convert';
import 'package:flutter/material.dart';

double defaultMargin = 24.0;

Color cWhite = Color(0xffFFFFFF);
Color cChocolate = Color(0xff954F32);
Color cBlack = Color(0xff000000);
Color cSoftGrey = Color(0xffF9F9F9);

class OnlineShopModel {
  OnlineShopModel({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.rating,
    required this.wire,
  });

  String id;
  String name;
  String description;
  String pictureId;
  double rating;
  Wire wire;

  factory OnlineShopModel.fromJson(Map<String, dynamic> json) =>
      OnlineShopModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        pictureId: json["pictureId"],
        rating: json["rating"].toDouble(),
        wire: Wire.fromJson(json["wire"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "pictureId": pictureId,
        "rating": rating,
        "wire": wire.toJson(),
      };
}

class Wire {
  Wire({
    required this.wireless,
    required this.wired,
  });

  List<Wired> wireless;
  List<Wired> wired;

  factory Wire.fromJson(Map<String, dynamic> json) => Wire(
        wireless:
            List<Wired>.from(json["wireless"].map((x) => Wired.fromJson(x))),
        wired: List<Wired>.from(json["wired"].map((x) => Wired.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "wireless": List<dynamic>.from(wireless.map((x) => x.toJson())),
        "wired": List<dynamic>.from(wired.map((x) => x.toJson())),
      };
}

class Wired {
  Wired({
    required this.name,
  });

  String name;

  factory Wired.fromJson(Map<String, dynamic> json) => Wired(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

//
List<OnlineShopModel> parse(String? json) {
  if (json == null) {
    return [];
  }

  final List parsed = jsonDecode(json)['ol'];
  return parsed.map((data) => OnlineShopModel.fromJson(data)).toList();
}
