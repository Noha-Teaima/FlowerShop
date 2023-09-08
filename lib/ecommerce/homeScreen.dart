import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/ecommerce/addToCart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Catalog.dart';
import 'model/salesModel.dart';

class VerticalSliderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      // appBar: AppBar(title: Text('Vertical sliding carousel demo')),
      body: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: Column(
          children: [
            Container(
                child: CarouselSlider(
              options: CarouselOptions(
                height: 600,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                autoPlay: true,
              ),
              items: imageSliders,
            )),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 50,
              width: 200,
              child: ElevatedButton(
                  onPressed: () {
                    Get.to(CatalogScreen());
                    // Navigator.pushAndRemoveUntil(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) =>
                    //           (AddToCart(index: 2, name: "noha", price: 200))),
                    //   (Route<dynamic> route) => false,
                    // );
                  },
                  child: Text(
                    "Get Started",
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrangeAccent)),
            )
          ],
        ),
      ),
    );
  }
}

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.asset(
                      item,
                      fit: BoxFit.cover,
                      width: 1000.0,
                      height: 600,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 500.0, left: 20),
                      child: Text(
                        Titles[imgList.indexOf(item)],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )

                    // Positioned(
                    //   bottom: 0.0,
                    //   left: 0.0,
                    //   right: 0.0,
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //       gradient: LinearGradient(
                    //         colors: [
                    //           Color.fromARGB(200, 0, 0, 0),
                    //           Color.fromARGB(0, 0, 0, 0)
                    //         ],
                    //         begin: Alignment.bottomCenter,
                    //         end: Alignment.topCenter,
                    //       ),
                    //     ),
                    //     padding: EdgeInsets.symmetric(
                    //         vertical: 10.0, horizontal: 20.0),
                    //     // child: Text(
                    //     //   '${Titles.indexOf(item)} ',
                    //     //   style: TextStyle(
                    //     //     color: Colors.white,
                    //     //     fontSize: 20.0,
                    //     //     fontWeight: FontWeight.bold,
                    //     //   ),
                    //     // ),
                    //   ),
                    // ),
                  ],
                )),
          ),
        ))
    .toList();
