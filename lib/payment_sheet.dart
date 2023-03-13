import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'btn_widget.dart';

class PaymentSheet extends StatelessWidget {
  final double price;
  const PaymentSheet({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
              height: 85, child: Lottie.asset('assets/json/faceid-2.json')),
          ListTile(
            title: Text(
              'Wallet:',
              style: GoogleFonts.getFont('Barlow', fontWeight: FontWeight.bold),
            ),
            trailing: Text(
              '\$ 28,562',
              style: GoogleFonts.getFont('Barlow',
                  fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          ListTile(
            title: Text(
              'Total Price:',
              style: GoogleFonts.getFont('Barlow', fontWeight: FontWeight.bold),
            ),
            trailing: Text(
              '- \$ ${price.floor()}',
              style: GoogleFonts.getFont('Barlow',
                  color: Colors.red, fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          const Divider(
            thickness: 0.5,
          ),
          ListTile(
            trailing: Text(
              '\$ ${(28562 - price).floor()}',
              style: GoogleFonts.getFont('Barlow',
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
            ),
          ),
          const SizedBox(height: 25),
          BtnWidget(
              text: 'Done',
              color: Colors.black,
              txtColor: Colors.white,
              destination: () {
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
