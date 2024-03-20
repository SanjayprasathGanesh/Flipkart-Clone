import 'package:flipkart/models/individualproductModel.dart';
import 'package:flipkart/models/mycart.dart';
import 'package:flipkart/screens/cart.dart';
import 'package:flipkart/screens/ordersummary.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../SQLiteDB/addressModel.dart';
import '../SQLiteDB/userService.dart';
import '../services/productService.dart';

class SpecificProduct extends StatefulWidget {
  final String id;
  final String? cart;
  const SpecificProduct({required this.id,required this.cart, required key}) : super(key: key);

  @override
  State<SpecificProduct> createState() => _SpecificProductState();
}

class _SpecificProductState extends State<SpecificProduct> {
  TextEditingController pincode = TextEditingController();

  late Future<IndividualProduct> futureProduct = _productService.fetchProduct(widget.id);

  ProductService _productService = ProductService();

  String pin = '';

  List<AddressModel> addressList = <AddressModel>[];
  UserService _userService = UserService();

  String selected = '';
  bool isSelected = false;

  String price = '',discount = '';

  @override
  initState(){
    super.initState();
    getAllAddress();
    showAllAddress(context);
  }

  getAllAddress() async{
    var address = await _userService.ReadAddress();
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
        addressList.add(addressModel);
      });
    });
  }

  showAllAddress(BuildContext context){

    return ListView.builder(
      itemCount: addressList.length,
      itemBuilder: (context,index){

        String address = '${addressList[index].houseNo!}, ${addressList[index].area!}, ${addressList[index].city!}, ${addressList[index].state!}.';
        print(address);
        return Container(
          height: 80,
          clipBehavior: Clip.none,
          margin: const EdgeInsets.only(bottom: 10,top: 10),
          child: ListTile(
            contentPadding: const EdgeInsets.all(8.0),
            leading: Radio(
              value: addressList[index].id,
              groupValue: selected,
              onChanged: (value) {
                setState(() {
                  selected = value.toString();
                });
              },
            ),
            /*leading: IconButton(
              onPressed: (){
                setState(() {
                  selected = addressList[index].id!.toString();
                });
                if(selected == addressList[index].id!.toString()){
                  isSelected = true;
                }
                else{
                  isSelected = false;
                }
                print(addressList[index].id);
                print('Selected : $selected');
              },
              icon: isSelected ? const Icon(Icons.check_circle_outline,color: Colors.green,size: 25.0,) : const Icon(Icons.circle_outlined,size: 25.0,),
            ),*/
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text('${addressList[index].name!},${addressList[index].pincode!}',style: const TextStyle(
                          fontFamily: 'AnekLatin',
                          fontSize: 15.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                          wordSpacing: 1.0,
                        ),),
                        const SizedBox(width: 10.0,),
                        Container(
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text(addressList[index].addressType!,style: const TextStyle(
                            fontFamily: 'AnekLatin',
                            fontSize: 13.0,
                            color: Colors.black,
                          ),),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10.0,),
                Text(address,style: const TextStyle(
                  fontFamily: 'AnekLatin',
                  fontSize: 15.0,
                  color: Colors.grey,
                ),),
                const SizedBox(height: 10.0,),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    pincode.text = '641048';

    setState(() {
      pin = pincode.text;
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text("Specific Products",style: TextStyle(
          fontSize: 15.0,
          fontFamily: 'AnekLatin',
        ),),
      ),
      body: FutureBuilder<IndividualProduct>(
        future: futureProduct,
        builder: (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          else {

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Text('Name: ${snapshot.data!.name}'),
                  Container(
                    height: 400,
                    width: double.infinity,
                    child: PageView.builder(
                        itemCount: 4,
                        pageSnapping: true,
                        itemBuilder: (context,pagePosition){
                          return Container(
                              margin: EdgeInsets.all(10),
                              child: Image.network(
                                  snapshot.data!.photoUrls[pagePosition],
                                  fit: BoxFit.fitHeight,
                              )
                          );
                        })
                  ),
                  Container(
                    height: 200,
                    width: double.infinity,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('View more from Samsung',style: TextStyle(
                              fontFamily: 'AnekLatin',
                              fontSize: 13.0,
                              color: Colors.blue,
                            ),),
                            const SizedBox(height: 10.0,),
                            Text(snapshot.data!.name,style: const TextStyle(
                              fontFamily: 'AnekLatin',
                              fontSize: 13.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),),
                            const SizedBox(height: 10.0,),
                            const Text('#JustHere',style: TextStyle(
                              fontFamily: 'AnekLatin',
                              fontSize: 13.0,
                              color: Colors.grey,
                            ),),
                            const SizedBox(height: 10.0,),
                            Row(
                              children: [
                                const Row(
                                  children:[
                                    Icon(Icons.star, color: Colors.green),
                                    Icon(Icons.star, color: Colors.green),
                                    Icon(Icons.star, color: Colors.green),
                                    Icon(Icons.star_half_sharp, color: Colors.green),
                                    Icon(Icons.star_border_outlined, color: Colors.green),
                                  ],
                                ),
                                const SizedBox(width: 20.0,),
                                Text(snapshot.data!.review,style: const TextStyle(
                                  fontFamily: 'AnekLatin',
                                  fontSize: 13.0,
                                  color: Colors.blue,
                                ),),
                              ],
                            ),
                            const SizedBox(height: 10.0,),
                            Row(
                              children: [
                                Text(snapshot.data!.offer,style: const TextStyle(
                                  fontFamily: 'AnekLatin',
                                  fontSize: 13.0,
                                  color: Colors.green,
                                ),),
                                const SizedBox(width: 10.0,),
                                Text(snapshot.data!.price,style: const TextStyle(
                                  fontFamily: 'AnekLatin',
                                  fontSize: 13.0,
                                  color: Colors.black,
                                ),),
                              ],
                            ),
                            const SizedBox(height: 10.0,),
                            const Text('+ ₹29 Secured Packaging Fee',style: TextStyle(
                              fontFamily: 'AnekLatin',
                              fontSize: 13.0,
                              color: Colors.black,
                            ),),
                            const SizedBox(height: 10.0,),
                            const Text('Buy Now and Pay Later with EMI',style: TextStyle(
                              fontFamily: 'AnekLatin',
                              fontSize: 13.0,
                              color: Colors.black,
                            ),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5.0,),
                  Container(
                    height: 136.0,
                    width: double.infinity,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Deliver to : $pin",style: const TextStyle(
                                  fontFamily: 'AnekLatin',
                                  fontSize: 12.0,
                                ),),
                                /*const SizedBox(width: 2.0,),
                                Text(pincode.text,style: const TextStyle(
                                  fontFamily: 'AnekLatin',
                                  fontSize: 12.0,
                                ),),*/
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      elevation: 5.0,
                                    ),
                                    onPressed: (){
                                      showBottom();
                                    },
                                    child: const Text("Change",style: TextStyle(
                                      color: Colors.blue,
                                    ),)
                                )
                              ],
                            ),
                            const Divider(
                              thickness: 1.0,
                              color: Colors.grey,
                            ),
                            Row(
                              children: [
                                const Icon(Icons.fire_truck_outlined),
                                const SizedBox(width: 10.0,),
                                const Text("FREE DELIVERY",style: TextStyle(
                                  color: Colors.green,
                                  fontFamily: 'AnekLatin',
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.bold,
                                ),),
                                const SizedBox(width: 10.0,),
                                const Text("₹ 40  | ",style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: 13.0,
                                  fontFamily: 'AnekLatin',
                                ),),
                                Text(snapshot.data!.delivery,style: const TextStyle(
                                  fontSize: 13.0,
                                  fontFamily: 'AnekLatin',
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.bold,
                                ),),
                                const SizedBox(width: 10.0,),
                                IconButton(
                                    onPressed: (){},
                                    icon: const Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 15.0,),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 850,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Highlights",style: TextStyle(
                              fontFamily: 'AnekLatin',
                              fontSize: 15.0,
                              letterSpacing: 0.8,
                              fontWeight: FontWeight.bold,
                            ),),
                            const SizedBox(height: 10.0,),
                            Row(
                              children: [
                                const Icon(Icons.memory,size: 35.0,),
                                const SizedBox(width: 10.0,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("RAM | ROM",style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'AnekLatin',
                                      letterSpacing: 0.5,
                                      fontSize: 14.0,
                                    ),),
                                    const SizedBox(height: 8.0,),
                                    Text(snapshot.data!.ram,style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'AnekLatin',
                                      letterSpacing: 0.5,
                                      fontSize: 14.0,
                                    ),),
                                    const SizedBox(height: 8.0,),
                                    const Text("Stores upto 2000 photos",style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'AnekLatin',
                                      letterSpacing: 0.5,
                                      fontSize: 14.0,
                                    ),),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(height: 10.0,),
                            Row(
                              children: [
                                const Icon(Icons.camera_alt_outlined,size: 35.0,),
                                const SizedBox(width: 10.0,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("Camera",style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'AnekLatin',
                                      letterSpacing: 0.5,
                                      fontSize: 14.0,
                                    ),),
                                    const SizedBox(height: 8.0,),
                                    Text(snapshot.data!.camera,style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'AnekLatin',
                                      letterSpacing: 0.5,
                                      fontSize: 14.0,
                                    ),),
                                    const SizedBox(height: 8.0,),
                                    const Text("Get a Crystal Clear Click",style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'AnekLatin',
                                      letterSpacing: 0.5,
                                      fontSize: 14.0,
                                    ),),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(height: 10.0,),
                            Row(
                              children: [
                                const Icon(Icons.phone_android_outlined,size: 35.0,),
                                const SizedBox(width: 10.0,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("Display",style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'AnekLatin',
                                      letterSpacing: 0.5,
                                      fontSize: 14.0,
                                    ),),
                                    const SizedBox(height: 8.0,),
                                    Text(snapshot.data!.display,style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'AnekLatin',
                                      letterSpacing: 0.5,
                                      fontSize: 14.0,
                                    ),),
                                    const SizedBox(height: 8.0,),
                                    const Text("Big Screen with Samsung Amoled Display",style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'AnekLatin',
                                      letterSpacing: 0.5,
                                      fontSize: 14.0,
                                    ),),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(height: 10.0,),
                            Row(
                              children: [
                                const Icon(Icons.battery_2_bar_outlined,size: 35.0,),
                                const SizedBox(width: 10.0,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("Battery",style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'AnekLatin',
                                      letterSpacing: 0.5,
                                      fontSize: 14.0,
                                    ),),
                                    const SizedBox(height: 8.0,),
                                    Text(snapshot.data!.battery,style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'AnekLatin',
                                      letterSpacing: 0.5,
                                      fontSize: 14.0,
                                    ),),
                                    const SizedBox(height: 8.0,),
                                    const Text("Charging that can last upto 2 days",style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'AnekLatin',
                                      letterSpacing: 0.5,
                                      fontSize: 14.0,
                                    ),),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(height: 20.0,),
                            const Text("Other Details",style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'AnekLatin',
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),),
                            const SizedBox(height: 10.0,),
                            DataTable(
                                columns: [
                                  const DataColumn(
                                    label: Text('Model Name',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: 'AnekLatin',
                                        fontSize: 15.0,),
                                    ),),
                                  DataColumn(
                                    label: Text(snapshot.data!.modelname,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'AnekLatin',
                                        fontSize: 15.0,
                                      ),
                                    ),),
                                ],
                                rows:[
                                  DataRow(cells: [
                                    const DataCell(Text("Model Number",style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'AnekLatin',
                                    fontSize: 15.0,),)),
                                    DataCell(Text(snapshot.data!.modelnumber,style: const TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'AnekLatin',
                                      fontSize: 15.0,
                                    ),)),
                                  ]),
                                  DataRow(cells: [
                                    const DataCell(Text("Color",style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'AnekLatin',
                                      fontSize: 15.0,),)),
                                    DataCell(Text(snapshot.data!.color,style: const TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'AnekLatin',
                                      fontSize: 15.0,
                                    ),)),
                                  ]),
                                  DataRow(cells: [
                                    const DataCell(Text("Sim Type",style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'AnekLatin',
                                      fontSize: 15.0,),)),
                                    DataCell(Text(snapshot.data!.simtype,style: const TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'AnekLatin',
                                      fontSize: 15.0,
                                    ),)),
                                  ]),
                                  DataRow(cells: [
                                    const DataCell(Text("Description",style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'AnekLatin',
                                      fontSize: 15.0,),)),
                                    DataCell(Text(snapshot.data!.description,style: const TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'AnekLatin',
                                      fontSize: 15.0,
                                    ),)),
                                  ]),
                                  DataRow(cells: [
                                    const DataCell(Text("Browse Type",style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'AnekLatin',
                                      fontSize: 15.0,),)),
                                    DataCell(Text(snapshot.data!.browsetype,style: const TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'AnekLatin',
                                      fontSize: 15.0,
                                    ),)),
                                  ]),
                                  DataRow(cells: [
                                    const DataCell(Text("Touch Screen",style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'AnekLatin',
                                      fontSize: 15.0,),)),
                                    DataCell(Text(snapshot.data!.touchscreen,style: const TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'AnekLatin',
                                      fontSize: 15.0,
                                    ),)),
                                  ]),
                                  DataRow(cells: [
                                    const DataCell(Text("OTG",style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'AnekLatin',
                                      fontSize: 15.0,),)),
                                    DataCell(Text(snapshot.data!.otg,style: const TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'AnekLatin',
                                      fontSize: 15.0,
                                    ),)),
                                  ]),
                                ]
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(color: Colors.grey),
              ),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          if(widget.cart == '0') {
                            widget.cart == '1';
                            _productService.handleUpdateCart(widget.id);
                            Fluttertoast.showToast(
                                msg: 'Product Added to Cart'
                            );
                          }
                          else{
                            _productService.handleDeUpdateCart(widget.id);
                            Fluttertoast.showToast(
                                msg: 'Product Removed from Cart'
                            );
                            widget.cart == '0';
                          }
                        });

                      },
                      icon: const Icon(
                        Icons.shopping_cart_outlined,
                        size: 25.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  if (widget.cart == '1')
                    const Icon(
                      Icons.check_circle_sharp,
                      size: 20.0,
                      color: Colors.green,
                    ),
                  if (widget.cart == '0')
                    const Icon(
                      Icons.check_box_outline_blank,
                      size: 20.0,
                    ),
                ],
              ),
            ),
            Container(
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(color: Colors.grey),
              ),
              child: TextButton(
                onPressed: (){},
                child: const Text('Pay with EMI',style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'AnekLatin',
                  fontSize: 15.0,
                ),),
              )
            ),
            Container(
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(color: Colors.grey),
                  color: const Color(0xFFffd000),
                ),
                child: TextButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => OrderSummary(id: widget.id, key: null)));
                  },
                  child: const Text('Buy Now',style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'AnekLatin',
                    fontSize: 15.0,
                  ),),
                )
            ),
          ],
        )
      ],
    );
  }

  showBottom(){
    TextEditingController pin = TextEditingController();

    showModalBottomSheet(
        context: context,
        builder: (BuildContext context){
          return Container(
            height: 300,
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.cancel_sharp,size: 25.0,),
                    ),
                    const Text("Select Delivery Address",style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'AnekLatin',
                      letterSpacing: 0.8,
                    ),)
                  ],
                ),
                const Divider(height: 10.0,),
                SizedBox(
                  height: 100,
                  child: showAllAddress(context),
                ),
                Row(
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
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        child: const Text("SUBMIT",style: TextStyle(
                          fontFamily: 'AnekLatin',
                          fontSize: 14.0,
                        ),)
                    )
                  ],
                ),
              ],
            ),
          );
        }
    );
  }
}
