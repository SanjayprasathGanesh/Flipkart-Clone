// To parse this JSON data, do
//
//     final wishlist = wishlistFromJson(jsonString);

import 'dart:convert';

List<Wishlist> wishlistFromJson(String str) => List<Wishlist>.from(json.decode(str).map((x) => Wishlist.fromJson(x)));

String wishlistToJson(List<Wishlist> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Wishlist {
  String id;
  String name;
  String review;
  String price;
  String offer;
  String delivery;
  String ram;
  String display;
  String camera;
  String battery;
  String seller;
  String description;
  String modelnumber;
  String modelname;
  String color;
  String browsetype;
  String simtype;
  String touchscreen;
  String otg;
  List<String> photoUrls;
  int v;
  // String deliverycharges;
  String? wishlist;
  String? cart;

  Wishlist({
    required this.id,
    required this.name,
    required this.review,
    required this.price,
    required this.offer,
    required this.delivery,
    required this.ram,
    required this.display,
    required this.camera,
    required this.battery,
    required this.seller,
    required this.description,
    required this.modelnumber,
    required this.modelname,
    required this.color,
    required this.browsetype,
    required this.simtype,
    required this.touchscreen,
    required this.otg,
    required this.photoUrls,
    required this.v,
    // required this.deliverycharges,
    required this.wishlist,
    this.cart,
  });

  factory Wishlist.fromJson(Map<String, dynamic> json) => Wishlist(
    id: json["_id"],
    name: json["name"],
    review: json["review"],
    price: json["price"],
    offer: json["offer"],
    delivery: json["delivery"],
    ram: json["ram"],
    display: json["display"],
    camera: json["camera"],
    battery: json["battery"],
    seller: json["seller"],
    description: json["description"],
    modelnumber: json["modelnumber"],
    modelname: json["modelname"],
    color: json["color"],
    browsetype: json["browsetype"],
    simtype: json["simtype"],
    touchscreen: json["touchscreen"],
    otg: json["otg"],
    photoUrls: List<String>.from(json["photoUrls"].map((x) => x)),
    v: json["__v"],
    // deliverycharges: json["deliverycharges"],
    wishlist: json["wishlist"],
    cart: json["cart"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "review": review,
    "price": price,
    "offer": offer,
    "delivery": delivery,
    "ram": ram,
    "display": display,
    "camera": camera,
    "battery": battery,
    "seller": seller,
    "description": description,
    "modelnumber": modelnumber,
    "modelname": modelname,
    "color": color,
    "browsetype": browsetype,
    "simtype": simtype,
    "touchscreen": touchscreen,
    "otg": otg,
    "photoUrls": List<dynamic>.from(photoUrls.map((x) => x)),
    "__v": v,
    // "deliverycharges": deliverycharges,
    "wishlist": wishlist,
    "cart": cart,
  };
}
