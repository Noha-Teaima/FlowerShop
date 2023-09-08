import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ecommerce/ecommerce/addToCart.dart';
import 'package:ecommerce/ecommerce/homeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import '../../const.dart';

import 'model/grid.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: currentIndex,
        backgroundColor: const Color.fromARGB(255, 224, 224, 224),
        items: [
          IconButton(
              icon: Icon(Icons.home),
              onPressed: () => Get.to(VerticalSliderDemo()),
              iconSize: 30),
          IconButton(
              icon: Icon(Icons.dataset_outlined),
              onPressed: () => Get.to(CatalogScreen()),
              iconSize: 30),

          // IconButton(
          //     icon: Icon(Icons.shopping_cart),
          //     onPressed: () => Get.to(),
          //     iconSize: 30),
          // Icon(Icons.category, size: 30),
          // Icon(CupertinoIcons.chat_bubble_fill, size: 30),
          // Icon(Icons.shopping_cart, size: 30),
        ],
        onTap: (index) {
          currentIndex = index;
        },
      ),
      backgroundColor: Colors.grey[300],
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Image.network(
              //   background,
              //   fit: BoxFit.cover,
              // ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Catalog",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Icon(CupertinoIcons.list_bullet),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: GridB(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.grey[300],
      elevation: 0,
      leading: IconButton(
          onPressed: (() => Get.to(VerticalSliderDemo())),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          )),
      title: Text(
        "Our Plants",
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
