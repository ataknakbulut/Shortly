import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grisoft_code_challange/const.dart';
import 'package:grisoft_code_challange/controller/sql_controller.dart';
import 'package:grisoft_code_challange/view/component/default_button.dart';
import 'package:clipboard/clipboard.dart';

class LinkListCard extends StatelessWidget {
  final SqlController _sqlController = Get.find<SqlController>();

  LinkListCard({
    required this.id,
    required this.title,
    required this.description,
    required this.copied,
  });

  final int id;
  final String title, description;
  bool copied;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => _sqlController.deleteItem(id),
            ),
          ],
        ),
        const Divider(
          thickness: 2.0,
          indent: 10.0,
          endIndent: 10.0,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          width: double.infinity,
          child: Text(
            description,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: kPrimaryColor,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36.0, vertical: 20.0),
          child: SizedBox(
            width: double.infinity,
            child: copied == true
                ? DefaultButton(
                    backgroundColor: Colors.black,
                    text: 'COPIED',
                    onPressed: () => null,
                  )
                : DefaultButton(
                    backgroundColor: kPrimaryColor,
                    text: 'COPY',
                    onPressed: () {
                      FlutterClipboard.copy(description)
                          .then((value) => copied = true);
                    },
                  ),
          ),
        ),
      ],
    );
  }
}
