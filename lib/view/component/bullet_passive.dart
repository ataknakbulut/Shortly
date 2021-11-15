import 'package:flutter/material.dart';

class BulletPassive extends StatelessWidget {
  BulletPassive(this.onTap);

  Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        height: 10.0,
        width: 10.0,
        margin: const EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(color: Colors.grey, width: 2),
        ),
      ),
    );
  }
}
