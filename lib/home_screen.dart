import 'package:flutter/material.dart';
import 'package:foodapp/controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  final controller = Get.put(Controller());
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromARGB(255, 249, 249, 249),
      appBar: AppBar(
        scrolledUnderElevation: 0,
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                children: [
                  SizedBox(
                    height: 90,
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: CustomChip(
                            icon: '🍕',
                            txt: 'Pizza',
                          ),
                        ),
                        CustomChip(
                          icon: '🍔',
                          txt: 'Burger',
                        ),
                        CustomChip(
                          icon: '🌮',
                          txt: 'Tacko',
                        ),
                        CustomChip(
                          icon: '🌭',
                          txt: 'Hotdog',
                        ),
                        CustomChip(
                          icon: '🍟',
                          txt: 'Frize',
                        ),
                        CustomChip(
                          icon: '🥗',
                          txt: 'Salad',
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: GridView.builder(
                      itemCount: controller.dataSet.length,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (ctx, i) => Container(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[200]!,
                              spreadRadius: 0,
                              blurRadius: 10,
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                  'assets/images/${controller.dataSet[i].image!}'),
                              const SizedBox(height: 10),
                              Text(
                                controller.dataSet[i].name!,
                                style: GoogleFonts.getFont('Lobster',
                                    fontSize: 17),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                '\$ ${controller.dataSet[i].price!}',
                                style: GoogleFonts.getFont('Barlow',
                                    fontSize: 15, fontWeight: FontWeight.w600),
                              ),
                            ]),
                      ),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 9 / 12,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}

class CustomChip extends StatelessWidget {
  final String icon, txt;
  const CustomChip({super.key, required this.icon, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[200]!,
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        children: [
          Text(
            icon,
            style: const TextStyle(fontSize: 32),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            txt,
            style: GoogleFonts.getFont('Barlow',
                fontSize: 17, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
