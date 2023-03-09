import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/controller.dart';
import 'package:foodapp/triangle_painter.dart';
import 'package:get/get.dart';

class PizzaScreen extends StatelessWidget {
  final controller = Get.put(Controller());
  PizzaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.fetchPizza();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Food Mood',
          style: TextStyle(fontWeight: FontWeight.w800),
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
                      Text(controller
                          .foodList[controller.contentIndex.value].name!),
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
                            height: 700,
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
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
