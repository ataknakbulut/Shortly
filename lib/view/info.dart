import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:grisoft_code_challange/const.dart';
import 'package:grisoft_code_challange/controller/info_controller.dart';
import 'package:grisoft_code_challange/view/home.dart';
import 'package:grisoft_code_challange/view/components/bullet_active.dart';
import 'package:grisoft_code_challange/view/components/bullet_passive.dart';
import 'package:grisoft_code_challange/view/components/info_slide_item.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Info extends StatelessWidget {
  final _infoController = Get.put(InfoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe9e9e9),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(kLogoPath),
            CarouselSlider(
              options: CarouselOptions(
                height: 300,
                viewportFraction: 1.0,
                initialPage: 0,
                autoPlay: false,
                enableInfiniteScroll: false,
                enlargeCenterPage: false,
                reverse: false,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                onPageChanged: (index, reason) =>
                    _infoController.onPageChanged(index),
                scrollDirection: Axis.horizontal,
              ),
              items: [
                InfoSlideItem(
                  title: "Brand Recognition",
                  text:
                      "Boos your brand recognition with each click. Generic link don\'t mean a thing. Branded links help instil confidence in your content",
                  iconPath: 'assets/info/info_1.png',
                  backgroundColor: Colors.purple,
                ),
                InfoSlideItem(
                  title: "Detailed Records",
                  text:
                      "Gain insights into who is clicking your link. Knowing when and where people engage with your content helps inform better decisions.",
                  iconPath: 'assets/info/info_2.png',
                  backgroundColor: Colors.yellow,
                ),
                InfoSlideItem(
                  title: "Fully Customizable",
                  text:
                      "Improve brand awareness and content discoverability through customizable links, supercharging audience engagement",
                  iconPath: 'assets/info/info_3.png',
                  backgroundColor: Colors.blueAccent,
                ),
              ],
              carouselController: _infoController.buttonCarouselController,
            ),
            Obx(
              () => Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 32.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (_infoController.getCurrentIndex() == 0)
                          BulletActive()
                        else
                          BulletPassive(
                              () => _infoController.onBulletTapped(0)),
                        if (_infoController.getCurrentIndex() == 1)
                          BulletActive()
                        else
                          BulletPassive(
                            () => _infoController.onBulletTapped(1),
                          ),
                        if (_infoController.getCurrentIndex() == 2)
                          BulletActive()
                        else
                          BulletPassive(
                            () => _infoController.onBulletTapped(2),
                          ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.offAll(() => Home()),
                    child: const Text(
                      "Skip",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
