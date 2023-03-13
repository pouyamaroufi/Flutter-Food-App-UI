import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:foodapp/btn_widget.dart';
import 'package:foodapp/controller.dart';
import 'package:foodapp/payment_sheet.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class InvoiceScreen extends StatelessWidget {
  final controller = Get.put(Controller());
  InvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.invoice();
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          title: const Text(
            'Invoice',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Stack(children: [
          SingleChildScrollView(
            child: Column(
              children: [
                AnimationLimiter(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[200]!,
                          spreadRadius: 0,
                          blurRadius: 15,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: controller.invoiceList.length,
                      separatorBuilder: (ctx, i) => const Divider(
                        indent: 20,
                        endIndent: 20,
                        thickness: 0.5,
                      ),
                      itemBuilder: (BuildContext context, int i) =>
                          AnimationConfiguration.staggeredList(
                        position: i,
                        duration: const Duration(milliseconds: 375),
                        child: SlideAnimation(
                          duration: const Duration(milliseconds: 575),
                          horizontalOffset: 150.0,
                          child: FadeInAnimation(
                            child: ListTile(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              leading: Image.asset(
                                  'assets/images/${controller.invoiceList[i].image!}'),
                              title: Text(
                                controller.invoiceList[i].name!,
                                style: GoogleFonts.getFont('Barlow',
                                    fontWeight: FontWeight.w600),
                              ),
                              subtitle: Text(
                                '\$  ${controller.invoiceList[i].price!}',
                              ),
                              trailing: Text(
                                'X ${controller.invoiceList[i].item.toString()}',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          'order:',
                          style: GoogleFonts.getFont(
                            'Barlow',
                          ),
                        ),
                        trailing:
                            Text('\$  ${controller.totalPrice.value.floor()}'),
                      ),
                      ListTile(
                        title: Text(
                          'Tax:',
                          style: GoogleFonts.getFont(
                            'Barlow',
                          ),
                        ),
                        trailing: const Text('\$ 0.5'),
                      ),
                      ListTile(
                        title: Text(
                          'Dilivery:',
                          style: GoogleFonts.getFont(
                            'Barlow',
                          ),
                        ),
                        trailing: const Text('\$ 2'),
                      ),
                      const Divider(),
                      ListTile(
                        title: Text(
                          'Total Price:',
                          style: GoogleFonts.getFont('Barlow',
                              fontWeight: FontWeight.w600, fontSize: 20),
                        ),
                        trailing: Countup(
                          begin: 0,
                          end: controller.totalPrice.value + 2,
                          duration: const Duration(seconds: 2),
                          separator: ',',
                          prefix: '\$   ',
                          curve: Curves.easeIn,
                          style: GoogleFonts.getFont('Barlow',
                              fontWeight: FontWeight.w600, fontSize: 32),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                BtnWidget(
                    text: 'Pay with PayPal',
                    color: Colors.amber,
                    txtColor: Colors.black,
                    destination: () {}),
                const SizedBox(height: 20),
                BtnWidget(
                    text: '  Apple Pay',
                    color: Colors.black,
                    txtColor: Colors.white,
                    destination: () {
                      Get.bottomSheet(
                          Container(
                            width: Get.width,
                            color: Colors.white,
                            child: PaymentSheet(
                              price: controller.totalPrice.value,
                            ),
                          ),
                          clipBehavior: Clip.hardEdge,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30)),
                          ),
                          isDismissible: true);
                    }),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
