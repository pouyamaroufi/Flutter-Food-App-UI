import 'package:flutter/material.dart';

class BtnWidget extends StatelessWidget {
  const BtnWidget({
    Key? key,
    required this.text,
    required this.color,
    required this.destination,
    required this.txtColor,
  }) : super(key: key);

  final String text;
  final Color color;
  final Color txtColor;
  final Function destination;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60),
          ),
          minimumSize: const Size(double.infinity, 55),
        ),
        onPressed: () {
          destination();
        },
        child: Text(
          text,
          style: TextStyle(
            color: txtColor,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
