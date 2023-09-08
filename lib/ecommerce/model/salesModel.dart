import 'package:ecommerce/ecommerce/addToCart.dart';

final List<String> imgList = [
  "Images/img5.jpg",
  "Images/img3.jpg",
  "Images/img10.jpg",
  "Images/img12.jpg",
  "Images/img17.jpg",
  "Images/img14.jpg",
  "Images/img15.jpg",
  "Images/img16.jpg",
];
final List<String> Titles = [
  "Every flower is a soul blossoming in nature.",
  "Politeness is the flower of humanity.",
  "Love is the flower you’ve got to let grow.",
  "Life is the flower for which love is the honey.",
  "Earth laughs in flowers.",
  "Life would succ without you.",
  "Flowers are the music of the ground",
  "Love is flower like; Friendship is like a sheltering tree.",
  "A rose can never be a sunflower"
];
int count = 1;

class salesData {
  String? img;
  int? index;
  int? price;

  salesData({required this.img, required this.index, required this.price});

  salesData.fromJson(Map json) {
    this.img = json["image"];
    this.index = json["index"];
    this.price = json["price"];
  }
}
