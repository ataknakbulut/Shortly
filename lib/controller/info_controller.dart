import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

class InfoController extends GetxController {
  CarouselController buttonCarouselController = CarouselController();

  var currentIndex = 0.obs;

  void _setIndex(int index) {
    currentIndex.value = index;
  }

  void _animateTopage(int index) {
    buttonCarouselController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
  }

  void onPageChanged(int index) {
    _setIndex(index);
  }

  void onBulletTapped(int index) {
    _setIndex(index);
    _animateTopage(index);
  }

  int getCurrentIndex() => currentIndex.value;
}
