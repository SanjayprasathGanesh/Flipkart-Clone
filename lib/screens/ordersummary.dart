import 'package:flipkart/screens/address.dart';
import 'package:flipkart/screens/payment.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../SQLiteDB/addressModel.dart';
import '../SQLiteDB/userService.dart';
import '../models/individualproductModel.dart';
import '../services/productService.dart';

class OrderSummary extends StatefulWidget {
  final String id;
  const OrderSummary({required this.id, required key}) : super(key: key);

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {

  TextEditingController pincode = TextEditingController();
  TextEditingController amt = TextEditingController();
  TextEditingController dis = TextEditingController();

  late Future<IndividualProduct> futureProduct = _productService.fetchProduct(widget.id);
  ProductService _productService = ProductService();

  String selectedQuantity = '1';
  int count = 0;
  int ttl = 0;
  int index = 0;

  List<AddressModel> addressList = <AddressModel>[];
  UserService _userService = UserService();

  @override
  initState(){
    super.initState();
    getAllAddress();
  }

  getAllAddress() async{
    var address = await _userService.GetUpdated();
    addressList = <AddressModel>[];
    address.forEach((addresses){
      setState(() {
        var addressModel = AddressModel();
        addressModel.id = addresses['id'];
        addressModel.name = addresses['name'];
        addressModel.phoneNo = addresses['phoneNo'];
        addressModel.pincode = addresses['pincode'];
        addressModel.state = addresses['state'];
        addressModel.city = addresses['city'];
        addressModel.houseNo = addresses['houseNo'];
        addressModel.area = addresses['area'];
        addressModel.addressType = addresses['addressType'];
        addressModel.selected = addresses['selected'];
        addressList.add(addressModel);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Summary",style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15.0,
          fontFamily: 'AnekLatin',
          letterSpacing: 0.8,
        ),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 80,
              padding: const EdgeInsets.all(15.0),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Icon(Icons.check_circle_outline,color: Colors.blue,size: 30.0,),
                      SizedBox(height: 5.0,),
                      Text('Address',style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'AnekLatin',
                        letterSpacing: 0.8,
                      ),)
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 15.0,
                        backgroundColor: Colors.blue,
                        child: Text('2',style: TextStyle(
                          color: Colors.white,
                        ),),
                      ),
                      SizedBox(height: 5.0,),
                      Text('Order Summary',style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'AnekLatin',
                        letterSpacing: 0.8,
                      ),)
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 15.0,
                        backgroundColor: Colors.grey,
                        child: Text('3',style: TextStyle(
                          color: Colors.white,
                        ),),
                      ),
                      SizedBox(height: 5.0,),
                      Text('Payment',style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'AnekLatin',
                        letterSpacing: 0.8,
                      ),)
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 120,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
              ),
              margin: const EdgeInsets.all(5.0),
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(addressList[index].name!,style: const TextStyle(
                        fontFamily: 'AnekLatin',
                        fontSize: 13.0,
                        fontWeight: FontWeight.bold,
                      ),),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            elevation: 5.0,
                          ),
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const ChangeAddress()));
                          },
                          child: const Text("Change",style: TextStyle(
                            color: Colors.blue,
                          ),)
                      )
                    ],
                  ),
                  Text('${addressList[index].houseNo!},${addressList[index].area},${addressList[index].city}',style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'AnekLatin',
                    letterSpacing: 0.8,
                  ),),
                  const SizedBox(height: 10.0,),
                  Text(addressList[index].phoneNo!,style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'AnekLatin',
                    letterSpacing: 0.8,
                  ),),
                ],
              ),
            ),
            Container(
              height: 260,
              child: FutureBuilder<IndividualProduct>(
                  future: futureProduct,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }
                    else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }
                    else {
                      final itemPrice = snapshot.data!.price;
                      amt.text = itemPrice;
                      dis.text = snapshot.data!.offer.toString();


                      //final item_price = snapshot.data!.price;
                      // ttl_amt = item_price.toString().replaceAll(',', '');
                      // ttl_amt = item_price;
                      // discount = snapshot.data!.offer.toString();

                      //print(ttl_amt);

                      return Container(
                        height: 300,
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          elevation: 10,
                          margin: const EdgeInsets.all(10.0),
                          child: InkWell(
                            onTap: (){
                              /*setState(() {
                            if(cart![index].id == '651ff04d1ac3898ee7fd5123'){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const SpecificProduct()));
                            }
                          });*/
                            },
                            child: Container(
                                height: 200,
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            width: 130,
                                            height: 130,
                                            child: Image.network(
                                              snapshot.data!.photoUrls[0],
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 180,
                                                padding: const EdgeInsets.only(top: 1),
                                                child: Text(snapshot.data!.name,style: const TextStyle(
                                                  fontSize: 15.0,
                                                  fontFamily: 'AnekLatin',
                                                  letterSpacing: 0.5,
                                                  fontWeight: FontWeight.bold,
                                                ),),
                                              ),
                                              Container(
                                                width: 180,
                                                padding: const EdgeInsets.only(top: 3),
                                                child: Text(snapshot.data!.ram,style: const TextStyle(
                                                  fontSize: 15.0,
                                                  fontFamily: 'AnekLatin',
                                                  letterSpacing: 0.5,
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w400,
                                                ),),
                                              ),
                                              const SizedBox(height: 10.0,),
                                              Container(
                                                  width: 180,
                                                  child: Row(
                                                    children: [
                                                      Text(snapshot.data!.offer,style: const TextStyle(
                                                        fontSize: 15.0,
                                                        fontFamily: 'AnekLatin',
                                                        color: Colors.green,
                                                        fontWeight: FontWeight.bold,
                                                      ),),

                                                      const SizedBox(width: 10.0,),

                                                      Text(snapshot.data!.price,style: const TextStyle(
                                                        fontSize: 15.0,
                                                        fontFamily: 'AnekLatin',
                                                        fontWeight: FontWeight.w800,
                                                      ),),
                                                    ],
                                                  )
                                              ),
                                              const SizedBox(height: 10.0,),
                                              const Text(" + ₹232 Secured Packaging Fee",style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'AnekLatin',
                                                fontSize: 12.0,
                                              ),),
                                              const SizedBox(height: 10.0,),
                                              const Text("5 Offers Applied , 3 Offers Available",style: TextStyle(
                                                color: Colors.green,
                                                fontFamily: 'AnekLatin',
                                                fontSize: 12.0,
                                              ),),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Container(
                                        height: 50.0,
                                        padding: const EdgeInsets.only(left: 35.0),
                                        child: DropdownButton<String>(
                                          value: selectedQuantity,
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              selectedQuantity = newValue!;
                                              ttl *= int.parse(selectedQuantity);
                                            });
                                          },
                                          items: <String>['1', '2', '3', '4']
                                              .map<DropdownMenuItem<String>>((String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text('Qty : $value'),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                      const SizedBox(height: 10.0,),
                                      Container(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          children: [
                                            Text(snapshot.data!.delivery,style: const TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'AnekLatin',
                                              fontSize: 13.0,
                                            ),),
                                            const SizedBox(width: 5.0,),
                                            const Text('| ₹320',style: TextStyle(
                                              color: Colors.black,
                                              decoration: TextDecoration.lineThrough,
                                              fontFamily: 'AnekLatin',
                                              fontSize: 13.0,
                                            ),),
                                            const SizedBox(width: 5.0,),
                                            const Text('FREE DELIVERY',style: TextStyle(
                                              color: Colors.green,
                                              fontFamily: 'AnekLatin',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13.0,
                                            ),),
                                          ],
                                        ),
                                      ),

                                    ]
                                )
                            ),
                          ),
                        ),
                      );
                    }
                  }
              ),
            ),
            Container(
              height: 250.0,
              width: double.infinity,
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Price Details",style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'AnekLatin',
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),),
                  const SizedBox(height: 10.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Price ($ttl item)",style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'AnekLatin',
                        fontSize: 15.0,
                        letterSpacing: 0.5,
                      ),),
                      Text(amt.text,style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'AnekLatin',
                        fontSize: 15.0,
                        letterSpacing: 0.5,
                      ),),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Discount",style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'AnekLatin',
                        fontSize: 15.0,
                        letterSpacing: 0.5,
                      ),),
                      Text(dis.text,style: const TextStyle(
                        color: Colors.green,
                        fontFamily: 'AnekLatin',
                        fontSize: 15.0,
                        letterSpacing: 0.5,
                      ),),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Delivery Charges",style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'AnekLatin',
                        fontSize: 15.0,
                        letterSpacing: 0.5,
                      ),),
                      Text("FREE Delivery",style: TextStyle(
                        color: Colors.green,
                        fontFamily: 'AnekLatin',
                        fontSize: 15.0,
                        letterSpacing: 0.5,
                      ),),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Secured Packaging Fee",style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'AnekLatin',
                        fontSize: 15.0,
                        letterSpacing: 0.5,
                      ),),
                      Text("₹30",style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.lineThrough,
                        fontFamily: 'AnekLatin',
                        fontSize: 15.0,
                        letterSpacing: 0.5,
                      ),),
                    ],
                  ),
                  const Divider(
                    thickness: 0.5,
                    color: Colors.grey,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Total Amount",style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'AnekLatin',
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                        letterSpacing: 0.5,
                      ),),
                      Text('₹${amt.text}',style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'AnekLatin',
                        fontSize: 15.0,
                        letterSpacing: 0.5,
                      ),),
                    ],
                  ),
                  const Divider(
                    thickness: 0.5,
                    color: Colors.grey,
                  ),
                  const Text("You will Save 5000 on this order",style: TextStyle(
                    color: Colors.green,
                    fontFamily: 'AnekLatin',
                    fontSize: 15.0,
                  ),)
                ],
              ),
            )
          ],
        ),
      ),
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("₹${amt.text}",style: const TextStyle(
              color: Colors.black,
              fontSize: 15.0,
              fontFamily: 'AnekLatin',
            ),),
            Container(
              width: 150.0,
              child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFFffc300),
                  ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Payment(id: widget.id,key: null,)));
                  },
                  child: const Text('Continue',style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                    fontFamily: 'AnekLatin',
                    fontWeight: FontWeight.bold,
                  ),)
              ),
            )
          ],
        )
      ],
    );
  }

  showBottom() {
    TextEditingController pin = TextEditingController();

    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 200,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      label: const Text("Enter Pincode"),
                      hintText: "Enter Pincode..",
                      contentPadding: const EdgeInsets.all(5.0),
                      errorText: pin.text.isEmpty ? "Enter a Pincode" : null,
                    ),
                    controller: pincode,
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("SUBMIT", style: TextStyle(
                      fontFamily: 'AnekLatin',
                      fontSize: 14.0,
                    ),)
                )
              ],
            ),
          );
        }
    );
  }

}
