import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:grisoft_code_challange/const.dart';
import 'package:grisoft_code_challange/controller/home_controller.dart';
import 'package:grisoft_code_challange/controller/sql_controller.dart';
import 'package:grisoft_code_challange/services.dart';
import 'package:grisoft_code_challange/view/component/default_button.dart';
import 'package:grisoft_code_challange/view/component/link_list_card.dart';
import 'package:string_validator/string_validator.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Home extends StatelessWidget {
  final _homeController = Get.put(HomeController());
  final _sqlController = Get.put(SqlController());
  final _formKey = GlobalKey<FormState>();
  final _textFieldController = TextEditingController();

  Future<void> clickButton() async {
    _formKey.currentState!.validate();

    if (_homeController.getHasError() == false) {
      Get.dialog(
        const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
          ),
        ),
        barrierDismissible: false,
      );

      await Services.genereteLink(_textFieldController.text)
          .then((response) async {
        if (response.ok) {
          _sqlController.addItem(
            _textFieldController.text,
            '${response.result!.fullShortLink}',
          );
          Get.back();

          Get.focusScope!.unfocus();
        } else {
          Get.back();
          Fluttertoast.showToast(
            msg: '${response.error}',
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            children: [
              Obx(
                () => Expanded(
                  child: _sqlController.getIsLoading()
                      ? const Center(
                          child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(kPrimaryColor),
                          ),
                        )
                      : _sqlController.getLinkCount() == 0
                          ? ListView(
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
                                  padding: const EdgeInsets.only(bottom: 16.0),
                                  child: const Text(
                                    "Paste your first link into\n the field to shorten it",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                )
                              ],
                            )
                          : SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(top: 36.0),
                                    child: const Text(
                                      "Your Link History",
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: _sqlController.getLinkCount(),
                                    itemBuilder: (context, index) => Card(
                                      color: Colors.white,
                                      margin: const EdgeInsets.all(15),
                                      child: LinkListCard(
                                        id: _sqlController.getDatas()[index]
                                            ['id'],
                                        title: _sqlController.getDatas()[index]
                                            ['title'],
                                        description: _sqlController
                                            .getDatas()[index]['description'],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          border: _homeController.getShowRedBorder() == true
                              ? Border.all(width: 2, color: Colors.red)
                              : Border.all(),
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: TextFormField(
                          controller: _textFieldController,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: const UnderlineInputBorder(
                                borderSide: BorderSide.none),
                            hintText: 'Shorten a link here ...',
                            hintStyle: TextStyle(
                              color: _homeController.getShowRedBorder() == true
                                  ? Colors.red
                                  : Colors.black54,
                            ),
                            fillColor: Colors.white,
                          ),
                          textInputAction: TextInputAction.send,
                          onEditingComplete: () async => await clickButton(),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              _homeController.updateShowRedBorder(true);
                              _homeController.updateHasError(true);
                            } else {
                              _homeController.updateShowRedBorder(false);
                              if (!isURL(
                                value,
                                {
                                  "protocols": ['']
                                },
                              )) {
                                _homeController.updateHasError(true);
                                Fluttertoast.showToast(
                                  msg: "Entered url is not valid",
                                );
                              } else {
                                _homeController.updateHasError(false);
                              }
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(24, 4, 25, 0),
                        child: SizedBox(
                          width: double.infinity,
                          child: DefaultButton(
                            backgroundColor: kPrimaryColor,
                            text: "SHORTEN IT!",
                            onPressed: () async => await clickButton(),
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
