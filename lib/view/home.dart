import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grisoft_code_challange/const.dart';
import 'package:grisoft_code_challange/view/components/default_button.dart';

class Home extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                    Form(
                      key: _formKey,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: 'Shorten a link here ...',
                            fillColor: Colors.white,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
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
                          onPressed: () => print("BASTI"),
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
    );
  }
}
