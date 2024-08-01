import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselDemo extends StatelessWidget
{
  CarouselController buttonCarouselController = CarouselController();
  final List<Widget> child = [
    Container(
      color: Colors.red,
      child: Center(
        child: Text(
          'Slide 1',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    ),
    Container(
      color: Colors.green,
      child: Center(
        child: Text(
          'Slide 2',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    ),
    Container(
      color: Colors.blue,
      child: Center(
        child: Text(
          'Slide 3',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) => Column
    (
      children:
      <Widget>[
        CarouselSlider(
          items: child,
          carouselController: buttonCarouselController,
          options: CarouselOptions(
            autoPlay: false,
            enlargeCenterPage: true,
            viewportFraction: 0.9,
            aspectRatio: 2.0,
            initialPage: 2,
          ),
        ),
        ElevatedButton(
          onPressed: () => buttonCarouselController.nextPage(
              duration: Duration(milliseconds: 300),
              curve: Curves.linear),
          child: Text('→'),
        )
      ]
  );
}

