import 'dart:convert';
import 'package:flipkart/models/individualproductModel.dart';
import 'package:flipkart/screens/wishlist.dart';
import 'package:http/http.dart' as http;
import '../models/mycart.dart';
import '../models/ordersModel.dart';
import '../models/productModel.dart';
import '../models/wishlistModel.dart';

class ProductService{
  Future<List<Products>?> fetchMobilePhones() async {
    final response = await http.get(Uri.parse('http://192.168.0.62:3001/individual/mobile'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Products> mobiles = data.map((item) => Products.fromJson(item)).toList();
      return mobiles;
    }
    else {
      throw Exception('Failed to load data');
    }
  }

  Future<IndividualProduct> fetchProduct(String id) async {
    final response = await http.get(Uri.parse('http://192.168.0.62:3001/individual/mobile/$id'));

    if (response.statusCode == 200) {
      return IndividualProduct.fromJson(json.decode(response.body));
    }
    else {
      throw Exception('Failed to load product');
    }
  }

  Future<List<MyCart>?> DisplayCart() async {
    final response = await http.get(Uri.parse('http://192.168.0.62:3001/cart'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<MyCart> cart = data.map((item) => MyCart.fromJson(item)).toList();
      return cart;
    }
    else {
      throw Exception('Failed to load Cart data');
    }
  }

  Future<void> updateCart(String id) async {
    int cart = 0;
    try {
      var url = Uri.parse('http://192.168.0.62:3001/cart/$id'); // Replace with your actual API endpoint

      var response = await http.put(
        url,
        body: {'cart': cart.toString()},
      );

      if (response.statusCode == 200) {
        print('Cart updated successfully');
        print('Response body: ${response.body}');
      } else if (response.statusCode == 404) {
        print('Mobile detail not found for id: $id');
        print('Response body: ${response.body}');
      } else if (response.statusCode == 400) {
        print('Invalid cart value: $cart');
        print('Response body: ${response.body}');
      } else {
        print('Unexpected error occurred');
        print('Response body: ${response.body}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<void> handleUpdateCart(String id) async {
    try {
      var url = Uri.parse('http://192.168.0.62:3001/cart/$id');

      var response = await http.put(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'cart': 0}),
      );

      if (response.statusCode == 200) {
        print('Updated mobile detail: ${response.body}');

      } else {
        print('Error updating cart. Status code: ${response.statusCode}');
      }
    }
    catch (error) {
      print('Error: $error');
    }
  }

  Future<void> handleDeUpdateCart(String id) async {
    try {
      var url = Uri.parse('http://192.168.0.62:3001/cart/$id');

      var response = await http.put(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'cart': 1}),
      );

      if (response.statusCode == 200) {
        print('DeUpdated mobile detail: ${response.body}');

      } else {
        print('Error updating cart. Status code: ${response.statusCode}');
      }
    }
    catch (error) {
      print('Error: $error');
    }
  }

  Future<List<Wishlist>?> DisplayWishlist() async {
    final response = await http.get(Uri.parse('http://192.168.0.62:3001/wishlist'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Wishlist> wishlist = data.map((item) => Wishlist.fromJson(item)).toList();
      return wishlist;
    }
    else {
      throw Exception('Failed to load Wishlist data');
    }
  }

  Future<void> handleUpdateWishlist(String id) async {
    try {
      var url = Uri.parse('http://192.168.0.62:3001/wishlist/$id');

      var response = await http.put(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'wishlist': 0}),
      );

      if (response.statusCode == 200) {
        print('Updated Wishlist: ${response.body}');

      } else {
        print('Error updating Wishlist. Status code: ${response.statusCode}');
      }
    }
    catch (error) {
      print('Error: $error');
    }
  }

  Future<void> handleDeUpdateWishlist(String id) async {
    try {
      var url = Uri.parse('http://192.168.0.62:3001/wishlist/$id');

      var response = await http.put(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'wishlist': 1}),
      );

      if (response.statusCode == 200) {
        print('DeUpdated Wishlist detail: ${response.body}');

      } else {
        print('Error updating Wishlist. Status code: ${response.statusCode}');
      }
    }
    catch (error) {
      print('Error: $error');
    }
  }

  Future<List<Orders>?> fetchOrders() async {
    final response = await http.get(Uri.parse('http://192.168.0.62:3001/orders'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Orders> orders = data.map((item) => Orders.fromJson(item)).toList();
      return orders;
    }
    else {
      throw Exception('Failed to load Orders Data');
    }
  }

  Future<void> handleUpdateOrders(String id) async {
    try {
      var url = Uri.parse('http://192.168.0.62:3001/order/$id');

      var response = await http.put(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'order': 0}),
      );

      if (response.statusCode == 200) {
        print('Ordered mobile detail: ${response.body}');

      } else {
        print('Error updating Order. Status code: ${response.statusCode}');
      }
    }
    catch (error) {
      print('Error: $error');
    }
  }
}

