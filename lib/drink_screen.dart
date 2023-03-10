import 'package:avatar_stack/avatar_stack.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/controller.dart';
import 'package:foodapp/triangle_painter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DrinkScreen extends StatelessWidget {
  final controller = Get.put(Controller());
  DrinkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          '🥤 Drink Mood 🥤',
          style: GoogleFonts.getFont('Barlow',
              fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: Obx(
        () => Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              right: -220,
              top: -120,
              child: RotationTransition(
                turns: const AlwaysStoppedAnimation(160 / 360),
                child: RawMaterialButton(
                  splashColor: Colors.white,
                  highlightColor: Colors.white,
                  onPressed: () {},
                  child: CustomPaint(
                    painter: TrianglePainter(
                      strokeColor: Colors.red[400]!,
                      strokeWidth: 10,
                      paintingStyle: PaintingStyle.fill,
                    ),
                    child: const SizedBox(
                      height: 900,
                      width: 500,
                    ),
                  ),
                ),
              ),
            ),
            controller.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 150,
                      ),
                      Text(
                        controller
                            .drinkList[controller.contentIndex.value].name!,
                        style: GoogleFonts.getFont('Lobster', fontSize: 25),
                      ),
                      CarouselSlider.builder(
                        itemCount: controller.drinkList.length,
                        itemBuilder: (BuildContext context, int i,
                                int pageViewIndex) =>
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Image.asset(
                                    'assets/images/${controller.drinkList[i].image!}')),
                        options: CarouselOptions(
                            height: 390,
                            aspectRatio: 1,
                            viewportFraction: 0.7,
                            initialPage: 0,
                            enlargeStrategy: CenterPageEnlargeStrategy.scale,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: false,
                            enlargeCenterPage: true,
                            onPageChanged: (i, change) {
                              controller.contentIndex.value = i;
                            }),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Icon(
                            Icons.heart_broken_rounded,
                            color: Colors.grey,
                          ),
                          Text(
                            '${controller.drinkList[controller.contentIndex.value].price!} \$',
                            style: GoogleFonts.getFont('Barlow',
                                fontSize: 25, fontWeight: FontWeight.w600),
                          ),
                          const Icon(
                            Icons.favorite_rounded,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      const SizedBox(height: 35),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            iconSize: 35,
                            onPressed: () {
                              if (controller
                                      .drinkList[controller.contentIndex.value]
                                      .item !=
                                  0) {
                                controller
                                    .drinkList[controller.contentIndex.value]
                                    .item = controller
                                        .drinkList[
                                            controller.contentIndex.value]
                                        .item! -
                                    1;
                                controller.removeOrder(controller
                                    .drinkList[controller.contentIndex.value]
                                    .id!);
                              }
                            },
                            icon: const Icon(
                              Icons.remove,
                            ),
                          ),
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.red[400]!,
                            child: Center(
                              child: Text(
                                controller
                                    .drinkList[controller.contentIndex.value]
                                    .item
                                    .toString(),
                                style: GoogleFonts.getFont('Barlow',
                                    fontSize: 28,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          IconButton(
                            iconSize: 35,
                            onPressed: () {
                              controller
                                  .drinkList[controller.contentIndex.value]
                                  .item = controller
                                      .drinkList[controller.contentIndex.value]
                                      .item! +
                                  1;
                              controller.addOrder(controller
                                  .drinkList[controller.contentIndex.value]
                                  .id!);
                            },
                            icon: const Icon(
                              Icons.add,
                            ),
                          ),
                        ],
                      ),
                      Container(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: AvatarStack(
                                      height: 50,
                                      avatars: [
                                        for (var n = 0;
                                            n < controller.orderList.length;
                                            n++)
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
                      ),
                      if (controller.orderList.isNotEmpty)
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 130, vertical: 10),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Continue 🥤',
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                        )
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
