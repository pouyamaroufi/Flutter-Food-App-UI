import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/triangle_painter.dart';

class PizzaScreen extends StatelessWidget {
  PizzaScreen({super.key});

  final pizaaData = [
    'assets/images/pizza-01.png',
    'assets/images/pizza-02.png',
    'assets/images/pizza-03.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Food Mood',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
      ),
      body: Stack(
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CarouselSlider.builder(
                itemCount: pizaaData.length,
                itemBuilder: (BuildContext context, int i, int pageViewIndex) =>
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Image.asset(pizaaData[i])),
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
                ),
              ),
              Slider(
                  activeColor: Colors.amber,
                  thumbColor: Colors.blueGrey,
                  inactiveColor: Colors.grey,
                  min: 0.0,
                  max: 3,
                  divisions: 3,
                  value: 0.0,
                  onChanged: (value) {}),
            ],
          )
        ],
      ),
    );
  }
}
