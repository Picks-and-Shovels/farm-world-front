import 'package:flutter/material.dart';

class post {
  String? imagePath;
  String? Name;
  String? kind;
  bool? flyExist = false;

  post(
      {required this.Name,
      required this.kind,
      required this.imagePath,
      this.flyExist});
}
