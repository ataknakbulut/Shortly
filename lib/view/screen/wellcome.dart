import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grisoft_code_challange/const.dart';
import 'package:grisoft_code_challange/view/component/default_button.dart';
import 'package:grisoft_code_challange/view/screen/info.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Wellcome extends StatelessWidget {
  const Wellcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(kLogoPath),
            SvgPicture.asset(kIllustrationPath),
            Container(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: const Text(
                'More than just shorter links',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 42.0,
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.only(bottom: 24.0, left: 12.0, right: 12.0),
              child: const Text(
                'Build your brand\'s recognition and get detailed insights on how your links are performing',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SizedBox(
                width: double.infinity,
                child: DefaultButton(
                  backgroundColor: kPrimaryColor,
                  text: 'START',
                  onPressed: () => Get.to(() => Info()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
