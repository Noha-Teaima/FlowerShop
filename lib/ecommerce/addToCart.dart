import 'package:ecommerce/ecommerce/Catalog.dart';
import 'package:ecommerce/ecommerce/HiveData.dart';
import 'package:ecommerce/ecommerce/cubit/cubit/sales_cubit.dart';
import 'package:ecommerce/ecommerce/homeScreen.dart';
import 'package:ecommerce/ecommerce/model/grid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import 'model/salesModel.dart';

class AddToCart extends StatefulWidget {
  int price;
  String name;
  int index;
  AddToCart(
      {super.key,
      required this.index,
      required this.name,
      required this.price});

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  String text = "What You Buy";
  @override
  void initState() {
    HiveHelper.GetItem();

    if (HiveHelper.Sales.length == 0) {
      text = "Nothig, Please Select Item";
    }
    super.initState();
  }

  // String name = "Name";
  // int price = 50;
  // List sales = [];
  // int count = 1;
  // index  name  price
  int count = 1;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SalesCubit>();
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              ClipRRect(
                  child: Image.asset(
                    GridBState.gridMap[widget.index]["images"],
                    height: 350,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    // width: double.infinity,
                  ),

                  // color: Colors.green,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(
                        50,
                      ),
                      bottomRight: Radius.circular(50))),
              Padding(
                padding: const EdgeInsets.only(top: 40.0, left: 20),
                child: InkWell(
                    onTap: () => Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => (CatalogScreen())),
                          (Route<dynamic> route) => false,
                        ),
                    child: Icon(Icons.arrow_back)),
              )
            ]),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        widget.name,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "\$ ${widget.price}",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      IconWidget(
                        icon: Icons.add,
                        op: () {
                          // cubit.getCount("+");
                          count = count + 1;

                          setState(() {});
                        },
                      ),
                      Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("0${count}")),
                      IconWidget(
                        icon: CupertinoIcons.minus,
                        op: () {
                          // cubit.getCount("-");
                          if (count > 1) {
                            count = count - 1;
                          }

                          setState(() {});
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Flowers don’t worry about how they’re going to bloom. They just open up and turn toward the light and that makes them beautiful.",
                    style: TextStyle(fontSize: 15, color: Colors.blueGrey),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Includes",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ImgWidget(imgList[5]),
                      ImgWidget(imgList[6]),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    width: 200,
                    child: ElevatedButton(
                        onPressed: () {
                          var map = GridBState.gridMap[widget.index];
                          // print(map["price"] * count);

                          map["price"] = (widget.price * count);
                          print(map.toString() + "ttttttttttttttttttt");
                          print(widget.price);

                          HiveHelper.addItem(map);
                          print(widget.price.toString() +
                              "lllllllllllllllllllllllllllllll");
                          // print(HiveHelper.Sales[widget.index]["price"]
                          //         .toString() +
                          //     "jjjjjjjjjjjjjjjjjjj");
                          // cubit.countList(widget.index);

                          // print(HiveHelper.Sales);
                          // setState(() {});
                          AddToCartDailog(context, cubit);
                        },
                        child: Text(
                          "Add To Cart",
                          style: TextStyle(fontSize: 20),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrangeAccent)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> AddToCartDailog(BuildContext context, SalesCubit cubit) {
    return showDialog(
        context: context,
        builder: (context) {
          return BlocBuilder<SalesCubit, SalesState>(
            builder: (context, state) {
              return AlertDialog(
                actions: [
                  TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.deepOrangeAccent),
                    onPressed: () {
                      // if (HiveHelper.Sales == []) {
                      //   text =
                      //       "Nothig, Please Select Item";
                      // }

                      BuyDialog(context, cubit);

                      // cubit.remove(widget.index);
                      // print(HiveHelper.totalPrice());
                    },
                    child: Text(
                      "Buy",
                      style: TextStyle(color: Colors.white),
                    ),
                    // c: Color.fromARGB(255, 155, 51, 219),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.deepOrangeAccent),
                    onPressed: () {
                      count = 1;
                      setState(() {});
                      Get.to(CatalogScreen());
                    },
                    child: Text(
                      "I want To Buy More",
                      style: TextStyle(color: Colors.white),
                    ),

                    // c: Color.fromARGB(255, 155, 51, 219),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.deepOrangeAccent),
                    onPressed: () {
                      count = 1;
                      cubit.removeAll();

                      setState(() {});

                      Navigator.of(context).pop();
                      Get.to(CatalogScreen());
                    },
                    child: BlocBuilder<SalesCubit, SalesState>(
                      builder: (context, state) {
                        if (state is SalesLoading) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return Text(
                          "Ok, Thanks",
                          style: TextStyle(color: Colors.white),
                        );
                      },
                    ),
                  )
                ],
                ///////////////////////////////////////////////لسه
                title: Text("what You Buy"),
                content: BlocBuilder<SalesCubit, SalesState>(
                  builder: (context, state) {
                    if (state is SalesLoading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                      itemCount: HiveHelper.Sales.length,
                      itemBuilder: (context, index2) => Column(children: [
                        ImgWidget(HiveHelper.Sales[index2]["images"]),
                        Text(
                            "The Total Price is ${HiveHelper.Sales[index2]["price"]}"),
                        InkWell(child: BlocBuilder<SalesCubit, SalesState>(
                          builder: (context, state) {
                            if (state is SalesLoading) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            return Icon(Icons.delete);
                          },
                        ), onTap: () {
                          cubit.remove(index2);
                          // if (HiveHelper.Sales.length ==
                          //     1) {
                          //   Navigator.of(context).pop();
                          // }

                          // imgList[widget.index] = "";
                          count = 1;
                          setState(() {});
                          // Navigator.of(context).pop();
                        })
                      ]),
                    );
                  },
                ),

                // content: Text("Please Enter The Correct Id"),
              );
            },
          );
        });
  }

  Future<dynamic> BuyDialog(BuildContext context, SalesCubit cubit) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actions: [
              Text("Total Price For All Sales is ${HiveHelper.totalPrice()}"),
              TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.deepOrangeAccent),
                  onPressed: () {
                    count = 1;

                    cubit.removeAll();
                    setState(() {});
                    HiveHelper.total = 0;
                    Navigator.of(context).pop();
                  },
                  child: BlocBuilder<SalesCubit, SalesState>(
                    builder: (context, state) {
                      if (state is SalesLoading) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return Text(
                        "ok, I will Buy",
                        style: TextStyle(color: Colors.white),
                      );
                    },
                  )),
            ],
          );
        });
  }

  Widget ImgWidget(String img) {
    return ClipRRect(
        child: Image.asset(
          img,
          height: 150,

          width: 150,

          // width: double.infinity,
        ),

        // color: Colors.green,
        borderRadius: BorderRadius.circular(50));
  }

  // static num total = 0;

  // static num? totalPrice() {
  //   for (int i = 0; i < Sales.length; i++) {
  //     total += (Sales[i]["price"]);
  //     return total;
  //   }
  // }
}

class IconWidget extends StatelessWidget {
  final IconData icon;

  final int? Function()? op;
  const IconWidget({super.key, required this.icon, required this.op});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 25,
      color: Colors.white,
      child: InkWell(
        onTap: op,
        child: Icon(
          icon,
          size: 16,
        ),
      ),
    );
  }
}
