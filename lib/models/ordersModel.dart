// To parse this JSON data, do
//
//     final orders = ordersFromJson(jsonString);

import 'dart:convert';

List<Orders> ordersFromJson(String str) => List<Orders>.from(json.decode(str).map((x) => Orders.fromJson(x)));

String ordersToJson(List<Orders> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Orders {
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
  String? cart;
  String? deliverycharges;
  String? wishlist;
  String? quickcharging;
  String? sarvalue;
  String? inthebox;
  String? hybridsimslot;
  String? brand;
  String? order;
  String? ramsize;
  String? warranty;

  Orders({
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
    required this.cart,
    this.deliverycharges,
    this.wishlist,
    this.quickcharging,
    this.sarvalue,
    this.inthebox,
    this.hybridsimslot,
    this.brand,
    required this.order,
    this.ramsize,
    this.warranty,
  });

  factory Orders.fromJson(Map<String, dynamic> json) => Orders(
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
    cart: json["cart"],
    deliverycharges: json["deliverycharges"],
    wishlist: json["wishlist"],
    quickcharging: json["quickcharging"],
    sarvalue: json["sarvalue"],
    inthebox: json["inthebox"],
    hybridsimslot: json["hybridsimslot"],
    brand: json["brand"],
    order: json["order"],
    ramsize: json["ramsize"],
    warranty: json["warranty"],
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
    "cart": cart,
    "deliverycharges": deliverycharges,
    "wishlist": wishlist,
    "quickcharging": quickcharging,
    "sarvalue": sarvalue,
    "inthebox": inthebox,
    "hybridsimslot": hybridsimslot,
    "brand": brand,
    "order": order,
    "ramsize": ramsize,
    "warranty": warranty,
  };
}
