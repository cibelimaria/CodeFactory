import 'package:flutter/material.dart';

class CoursesModel {
  // final Function() onTap;
  final String id;
  final Image image;
  final Color colorImage;
  final String hours;
  final String title;
  final String subtitle;
  final String price;
  final String description;

  CoursesModel(this.image, this.colorImage, this.hours, this.title,
      this.subtitle, this.price, this.description, this.id);
}
