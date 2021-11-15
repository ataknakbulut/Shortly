import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:grisoft_code_challange/const.dart';
import 'package:grisoft_code_challange/controller/home_controller.dart';
import 'package:grisoft_code_challange/view/components/default_button.dart';
import 'package:string_validator/string_validator.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Home extends StatelessWidget {
  final _homeController = Get.put(HomeController());

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Container(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: SvgPicture.asset(kLogoPath)),
                    SvgPicture.asset(kIllustrationPath),
                    Container(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: const Text(
                        "Let's get started!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 22.0,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(bottom: 32.0),
                      child: const Text(
                        "Paste your first link into \nthe field to shorten it",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    color: Colors.purple.shade900,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: SvgPicture.asset(kShapePath),
                    ),
                  ),
                  Column(
                    children: [
                      Obx(
                        () => Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            border: _homeController.getHasError()
                                ? Border.all(width: 2, color: Colors.red)
                                : Border.all(),
                          ),
                          margin: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: const UnderlineInputBorder(
                                  borderSide: BorderSide.none),
                              hintText: 'Shorten a link here ...',
                              hintStyle: TextStyle(
                                color: _homeController.getHasError() == true
                                    ? Colors.red
                                    : Colors.black54,
                              ),
                              fillColor: Colors.white,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                _homeController.updateError(true);
                              } else {
                                _homeController.updateError(false);
                                if (!isURL(value)) {
                                  Fluttertoast.showToast(
                                    msg: "Entered url is not valid",
                                  );
                                }
                              }
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(24, 4, 25, 0),
                        child: SizedBox(
                          width: double.infinity,
                          child: DefaultButton(
                            backgroundColor: kPrimaryColor,
                            text: "SHORTEN IT!",
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // ScaffoldMessenger.of(context).showSnackBar(
                                //   const SnackBar(
                                //     content: Text(
                                //       'Processing Data',
                                //     ),
                                //   ),
                                // );
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
