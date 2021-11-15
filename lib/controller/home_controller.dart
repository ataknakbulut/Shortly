import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeController extends GetxController {
  var _hasError = false.obs;

  void updateError(bool response) {
    _hasError.value = response;
  }

  bool getHasError() => _hasError.value;
}
