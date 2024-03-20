// To parse this JSON data, do
//
//     final individualProduct = individualProductFromJson(jsonString);

import 'dart:convert';

List<IndividualProduct> individualProductFromJson(String str) => List<IndividualProduct>.from(json.decode(str).map((x) => IndividualProduct.fromJson(x)));

String individualProductToJson(List<IndividualProduct> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class IndividualProduct {
  String id;
  String name;
  String review;
  String price;
  String offer;
  String warranty;
  String delivery;
  String ram;
  String ramsize;
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
  String cart;
  String wishlist;
  String hybridsimslot;
  String inthebox;
  String sarvalue;
  String order;
  int v;

  IndividualProduct({
    required this.id,
    required this.name,
    required this.review,
    required this.price,
    required this.offer,
    required this.warranty,
    required this.delivery,
    required this.ram,
    required this.ramsize,
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
    required this.cart,
    required this.wishlist,
    required this.hybridsimslot,
    required this.inthebox,
    required this.sarvalue,
    required this.order,
    required this.v,
  });

  factory IndividualProduct.fromJson(Map<String, dynamic> json) => IndividualProduct(
    id: json["_id"],
    name: json["name"],
    review: json["review"],
    price: json["price"],
    offer: json["offer"],
    warranty: json["warranty"],
    delivery: json["delivery"],
    ram: json["ram"],
    ramsize: json["ramsize"],
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
    cart: json["cart"],
    wishlist: json["wishlist"],
    hybridsimslot: json["hybridsimslot"],
    inthebox: json["inthebox"],
    sarvalue: json["sarvalue"],
    order: json["order"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "review": review,
    "price": price,
    "offer": offer,
    "warranty": warranty,
    "delivery": delivery,
    "ram": ram,
    "ramsize": ramsize,
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
    "cart": cart,
    "wishlist": wishlist,
    "hybridsimslot": hybridsimslot,
    "inthebox": inthebox,
    "sarvalue": sarvalue,
    "order": order,
    "__v": v,
  };
}

// To parse this JSON data, do
//
//     final individualProduct = individualProductFromJson(jsonString);

/*import 'dart:convert';

IndividualProduct individualProductFromJson(String str) => IndividualProduct.fromJson(json.decode(str));

String individualProductToJson(IndividualProduct data) => json.encode(data.toJson());

class IndividualProduct {
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
  String cart;
  String deliverycharges;
  String wishlist;
  String quickcharging;
  String sarvalue;
  String inthebox;
  String hybridsimslot;
  String order;
  String ramsize;
  String brand;

  IndividualProduct({
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
    required this.deliverycharges,
    required this.wishlist,
    required this.quickcharging,
    required this.sarvalue,
    required this.inthebox,
    required this.hybridsimslot,
    required this.order,
    required this.ramsize,
    required this.brand,
  });

  factory IndividualProduct.fromJson(Map<String, dynamic> json) => IndividualProduct(
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
    order: json["order"],
    ramsize: json["ramsize"],
    brand: json["brand"],
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
    "order": order,
    "ramsize": ramsize,
    "brand": brand,
  };
}*/
