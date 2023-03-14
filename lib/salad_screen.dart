import 'package:avatar_stack/avatar_stack.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:foodapp/btn_widget.dart';
import 'package:foodapp/controller.dart';
import 'package:foodapp/drink_screen.dart';
import 'package:foodapp/responsive.dart';
import 'package:foodapp/triangle_painter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SaladScreen extends StatelessWidget {
  final controller = Get.put(Controller());
  SaladScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '🌽 Salad Mood 🥦',
          style: GoogleFonts.getFont('Barlow',
              fontSize: resW(25), fontWeight: FontWeight.bold),
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
                      strokeColor: Colors.lime[400]!,
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
                : AnimationLimiter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: AnimationConfiguration.toStaggeredList(
                        duration: const Duration(milliseconds: 375),
                        childAnimationBuilder: (widget) => SlideAnimation(
                          verticalOffset: 50.0,
                          child: FadeInAnimation(
                            child: widget,
                          ),
                        ),
                        children: [
                          SizedBox(height: resH(120)),
                          Text(
                            controller
                                .saladList[controller.contentIndex.value].name!,
                            style: GoogleFonts.getFont('Lobster',
                                fontSize: resW(20)),
                          ),
                          CarouselSlider.builder(
                            itemCount: controller.saladList.length,
                            itemBuilder: (BuildContext context, int i,
                                    int pageViewIndex) =>
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Image.asset(
                                        'assets/images/${controller.saladList[i].image!}')),
                            options: CarouselOptions(
                                height: resH(310),
                                aspectRatio: 1,
                                viewportFraction: 0.7,
                                initialPage: 0,
                                enlargeStrategy:
                                    CenterPageEnlargeStrategy.scale,
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
                                '\$ ${controller.saladList[controller.contentIndex.value].price!} \$',
                                style: GoogleFonts.getFont('Barlow',
                                    fontSize: resW(25),
                                    fontWeight: FontWeight.w600),
                              ),
                              const Icon(
                                Icons.favorite_rounded,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          SizedBox(height: resH(35)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                iconSize: resH(35),
                                onPressed: () {
                                  if (controller
                                          .saladList[
                                              controller.contentIndex.value]
                                          .item !=
                                      0) {
                                    controller
                                        .saladList[
                                            controller.contentIndex.value]
                                        .item = controller
                                            .saladList[
                                                controller.contentIndex.value]
                                            .item! -
                                        1;
                                    controller.removeOrder(controller
                                        .saladList[
                                            controller.contentIndex.value]
                                        .id!);
                                  }
                                },
                                icon: const Icon(
                                  Icons.remove,
                                ),
                              ),
                              CircleAvatar(
                                radius: resH(40),
                                backgroundColor: Colors.lime[300]!,
                                child: Center(
                                  child: Text(
                                    controller
                                        .saladList[
                                            controller.contentIndex.value]
                                        .item
                                        .toString(),
                                    style: GoogleFonts.getFont('Barlow',
                                        fontSize: resW(28),
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                              IconButton(
                                iconSize: resH(35),
                                onPressed: () {
                                  controller
                                      .saladList[controller.contentIndex.value]
                                      .item = controller
                                          .saladList[
                                              controller.contentIndex.value]
                                          .item! +
                                      1;
                                  controller.addOrder(controller
                                      .saladList[controller.contentIndex.value]
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 5,
                                        child: AvatarStack(
                                          height: resH(50),
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
                                              fontSize: resW(28),
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                          if (controller.orderList.isNotEmpty)
                            BtnWidget(
                                text: 'Continue 🥬',
                                color: Colors.lime,
                                txtColor: Colors.black,
                                destination: () {
                                  controller.contentIndex.value = 0;
                                  Get.to(() => DrinkScreen());
                                })
                        ],
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
