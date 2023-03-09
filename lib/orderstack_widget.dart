import 'package:avatar_stack/avatar_stack.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderStack extends StatelessWidget {
  final controller = Get.put(Controller());
  OrderStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          // border: Border.all(
          //     color:
          //         const Color.fromARGB(255, 193, 193, 193)),
          borderRadius: BorderRadius.circular(20)),
      child: controller.orderList.isEmpty
          ? null
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 5,
                  child: AvatarStack(
                    height: 50,
                    avatars: [
                      for (var n = 0; n < controller.orderList.length; n++)
                        AssetImage(
                            'assets/images/${controller.orderList[n].image!}'),
                    ],
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Text(
                    'X ${controller.orderList.length}',
                    textAlign: TextAlign.end,
                    style: GoogleFonts.getFont('Barlow',
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
    );
  }
}
