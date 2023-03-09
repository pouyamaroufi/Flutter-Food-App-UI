import 'package:avatar_stack/avatar_stack.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/controller.dart';
import 'package:foodapp/triangle_painter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PizzaScreen extends StatelessWidget {
  final controller = Get.put(Controller());
  PizzaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Food Mood',
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
                  onPressed: () {},
                  child: CustomPaint(
                    painter: TrianglePainter(
                      strokeColor: Colors.amber[300]!,
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        controller
                            .foodList[controller.contentIndex.value].name!,
                        style: GoogleFonts.getFont('Lobster', fontSize: 25),
                      ),
                      CarouselSlider.builder(
                        itemCount: controller.foodList.length,
                        itemBuilder: (BuildContext context, int i,
                                int pageViewIndex) =>
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Image.asset(
                                    'assets/images/${controller.foodList[i].image!}')),
                        options: CarouselOptions(
                            height: 400,
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
                            '${controller.foodList[controller.contentIndex.value].price!} \$',
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
                            onPressed: () {},
                            icon: const Icon(
                              Icons.remove,
                            ),
                          ),
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.amber[300]!,
                            child: Center(
                              child: Text(
                                controller.contentIndex.value.toString(),
                                style: const TextStyle(
                                    fontSize: 30, color: Colors.black),
                              ),
                            ),
                          ),
                          IconButton(
                            iconSize: 35,
                            onPressed: () {},
                            icon: const Icon(
                              Icons.add,
                            ),
                          ),
                        ],
                      ),
                      AvatarStack(
                        height: 50,
                        avatars: [
                          for (var n = 0; n < controller.foodList.length; n++)
                            AssetImage(
                                'assets/images/${controller.foodList[n].image!}'),
                        ],
                      ),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
