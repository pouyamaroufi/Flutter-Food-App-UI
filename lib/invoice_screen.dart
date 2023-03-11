import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:foodapp/controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class InvoiceScreen extends StatelessWidget {
  final controller = Get.put(Controller());
  InvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.invoice();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Invoice',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            children: [
              AnimationLimiter(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: controller.invoiceList.length,
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
                            '${controller.invoiceList[i].price!} \$',
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
              const Divider(),
              ListTile(
                title: Text(
                  'Total Price:',
                  style: GoogleFonts.getFont('Barlow',
                      fontWeight: FontWeight.w600, fontSize: 20),
                ),
                subtitle: Countup(
                  begin: 0,
                  end: controller.totalPrice.value,
                  duration: const Duration(seconds: 1),
                  separator: ',',
                  suffix: '  \$',
                  curve: Curves.easeIn,
                  style: GoogleFonts.getFont('Barlow',
                      fontWeight: FontWeight.w600, fontSize: 46),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
