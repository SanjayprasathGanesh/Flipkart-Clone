import 'package:flipkart/notification/notificationService.dart';
import 'package:flipkart/screens/ordersuccess.dart';
import 'package:flipkart/services/productService.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
enum PaymentOption { upi, wallets, creditCard, netBanking, cashOnDelivery, emi }


class Payment extends StatefulWidget {
  final String id;
  const Payment({required this.id, required key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {

  PaymentOption _selectedOption = PaymentOption.upi;

  NotificationService notificationService = NotificationService();

  ProductService _productService = ProductService();

  @override
  initState(){
    super.initState();
    notificationService.initializeNotifications();
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
                      Icon(Icons.check_circle_outline,color: Colors.blue,size: 30.0,),
                      SizedBox(height: 5.0,),
                      Text('Order Summary',style: TextStyle(
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
                        child: Text('3',style: TextStyle(
                          color: Colors.white,
                        ),),
                      ),
                      SizedBox(height: 5.0,),
                      Text('Payment',style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'AnekLatin',
                        letterSpacing: 0.8,
                      ),)
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 350,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RadioListTile<PaymentOption>(
                    title: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('UPI',style: TextStyle(
                          color: Colors.black,
                          fontSize: 17.0,
                          fontFamily: 'AnekLatin',
                        ),),
                        SizedBox(height: 10.0,),
                        Text('Pay by any UPI App',style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                          fontFamily: 'AnekLatin',
                        ),),
                      ],
                    ),
                    value: PaymentOption.upi,
                    groupValue: _selectedOption,
                    onChanged: (PaymentOption? value) {
                      setState(() {
                        _selectedOption = value!;
                      });
                    },
                  ),
                  RadioListTile<PaymentOption>(
                    title: const Text('Wallets',style: TextStyle(
                      color: Colors.black,
                      fontSize: 17.0,
                      fontFamily: 'AnekLatin',
                    ),),
                    value: PaymentOption.wallets,
                    groupValue: _selectedOption,
                    onChanged: (PaymentOption? value) {
                      setState(() {
                        _selectedOption = value!;
                      });
                    },
                  ),
                  RadioListTile<PaymentOption>(
                    title: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Credit / Debit / ATM Card',style: TextStyle(
                          color: Colors.black,
                          fontSize: 17.0,
                          fontFamily: 'AnekLatin',
                        ),),
                        SizedBox(height: 10.0,),
                        Text('Add and secure your card as per RBI Guidelines',style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                          fontFamily: 'AnekLatin',
                        ),),
                      ],
                    ),
                    value: PaymentOption.creditCard,
                    groupValue: _selectedOption,
                    onChanged: (PaymentOption? value) {
                      setState(() {
                        _selectedOption = value!;
                      });
                    },
                  ),
                  RadioListTile<PaymentOption>(
                    title: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Net Banking',style: TextStyle(
                          color: Colors.black,
                          fontSize: 17.0,
                          fontFamily: 'AnekLatin',
                        ),),
                        SizedBox(height: 10.0,),
                        Text('This Instrument has low success,use UPI or Cards for better experience',style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                          fontFamily: 'AnekLatin',
                        ),),
                      ],
                    ),
                    value: PaymentOption.netBanking,
                    groupValue: _selectedOption,
                    onChanged: (PaymentOption? value) {
                      setState(() {
                        _selectedOption = value!;
                      });
                    },
                  ),
                  RadioListTile<PaymentOption>(
                    title: const Text('Cash on Delivery',style: TextStyle(
                      color: Colors.black,
                      fontSize: 17.0,
                      fontFamily: 'AnekLatin',
                    ),),
                    value: PaymentOption.cashOnDelivery,
                    groupValue: _selectedOption,
                    onChanged: (PaymentOption? value) {
                      setState(() {
                        _selectedOption = value!;
                      });
                    },
                  ),
                  RadioListTile<PaymentOption>(
                    title: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('EMI (Easy Installment)',style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'AnekLatin',
                        ),),
                        Row(
                          children: [
                            Text('Unavailable',style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13.0,
                              fontFamily: 'AnekLatin',
                            ),),
                            SizedBox(width: 5.0,),
                            Icon(Icons.help,size: 20.0,),
                          ],
                        ),
                      ],
                    ),
                    value: PaymentOption.emi,
                    groupValue: _selectedOption,
                    onChanged: (PaymentOption? value) {
                      setState(() {
                        _selectedOption = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
            Container(
              height: 80,
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(10.0),
              child: const Card(
                child: Row(
                  children: [
                    SizedBox(width: 5.0,),
                    Icon(Icons.add),
                    SizedBox(width: 20.0,),
                    Text("Gift Card",style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'AnekLatin',
                      fontSize: 17.0,
                    ),)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      persistentFooterButtons: [
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("₹ 500",style: TextStyle(
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
                    _productService.handleUpdateOrders(widget.id);
                    Fluttertoast.showToast(
                        msg: 'Product Ordered Successfully'
                    );
                    Navigator.push(context, MaterialPageRoute(builder: (context) => OrderSuccessPage()));
                    notificationService.sendNotification(1, 'Order Placed Successfully', 'Your Product has been Ordered Successfully and it will be delivered with the date,Thanks For Ordering through Flipkart');
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
      ]
    );
  }
}
