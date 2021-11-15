import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeController extends GetxController {
  var _showRedBorder = false.obs;
  var _hasError = false.obs;

  void updateShowRedBorder(bool response) {
    _showRedBorder.value = response;
  }

  void updateHasError(bool response) {
    _hasError.value = response;
  }

  bool getShowRedBorder() => _showRedBorder.value;
  bool getHasError() => _hasError.value;
}
