import 'package:ecommerce/ecommerce/addToCart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GridB extends StatefulWidget {
  const GridB({super.key});

  @override
  State<GridB> createState() => GridBState();
}

class GridBState extends State<GridB> {
  static List<Map<String, dynamic>> gridMap = [
    {"images": "Images/plant1.jpg", "title": "Office Plant", "price": 20},
    {"images": "Images/plant2.jpg", "title": "Cactus", "price": 35},
    {"images": "Images/plant3.jpg", "title": "Natural Plant", "price": 27},
    {"images": "Images/plant4.jpg", "title": "Bird's Nest Fern", "price": 15},
    {"images": "Images/plant5.jpeg", "title": "Natural Plant", "price": 26},
    {"images": "Images/plant6.jpg", "title": "Lavender", "price": 50},
    {"images": "Images/plant7.jpeg", "title": "Plant", "price": 32},
    {"images": "Images/plant8.jpeg", "title": "Natural Plant", "price": 31},
    {"images": "Images/plant9.jpeg", "title": "soft Plant", "price": 30},
    {"images": "Images/plant10.jpeg", "title": "Rose Plant", "price": 25},
    {"images": "Images/plant11.jpeg", "title": "Savana Plant", "price": 18},
    {"images": "Images/plant12.jpeg", "title": "Natural Plant", "price": 18},
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12.0,
          crossAxisSpacing: 20.0,
          mainAxisExtent: 220,
        ),
        itemCount: gridMap.length,
        itemBuilder: (_, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                16.0,
              ),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                    child: InkWell(
                      onTap: () {
                        Get.to(AddToCart(
                            index: index,
                            name: gridMap.elementAt(index)['title'],
                            price: gridMap.elementAt(index)['price']));
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                        child: Image.asset(
                          "${gridMap.elementAt(index)['images']}",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${gridMap.elementAt(index)['title']}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        children: [
                          Text(
                            "\$ ${gridMap.elementAt(index)['price']}",
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 13,
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              Get.to(AddToCart(
                                  index: index,
                                  name: gridMap.elementAt(index)['title'],
                                  price: gridMap.elementAt(index)['price']));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Icon(
                                CupertinoIcons.cart_fill,
                                size: 20,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
