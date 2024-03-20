import 'package:flipkart/SQLiteDB/addressModel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../SQLiteDB/userService.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({super.key});

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {

  TextEditingController name = TextEditingController();
  TextEditingController phoneNum = TextEditingController();
  TextEditingController pincode = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController houseNo = TextEditingController();
  TextEditingController area = TextEditingController();

  UserService _userService = UserService();

  bool validateName = false,validatePhone = false,validatePin = false,validateState = false,validateCity = false,validateHouse = false,validateArea = false;
  String typeOfAddress = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Address"),
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
                      CircleAvatar(
                        radius: 15.0,
                        backgroundColor: Colors.blue,
                        child: Text('1',style: TextStyle(
                          color: Colors.white,
                        ),),
                      ),
                      SizedBox(height: 5.0,),
                      Text('Address',style: TextStyle(
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
            const SizedBox(height: 10.0,),
            Container(
              height: 700,
              width: double.infinity,
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      label: const Text("Full Name(Required) *",style: TextStyle(
                        fontFamily: 'AnekLatin',
                        letterSpacing: 0.5,
                      ),),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2.0),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      errorText:
                      validateName ? 'Full Name Value Can\'t Be Empty' : null,
                    ),
                    controller: name,
                  ),
                  const SizedBox(height: 10.0,),
                  TextField(
                    decoration: InputDecoration(
                      label: const Text("Phone Number(Required) *",style: TextStyle(
                        fontFamily: 'AnekLatin',
                        letterSpacing: 0.5,
                      ),),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2.0),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      errorText:
                      validatePhone ? 'Phone Number Value Can\'t Be Empty' : null,
                    ),
                    controller: phoneNum,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 10.0,),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            label: const Text("Pincode(Required) *",style: TextStyle(
                              fontFamily: 'AnekLatin',
                              letterSpacing: 0.5,
                            ),),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2.0),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            errorText:
                            validatePin ? 'Pincode Value Can\'t Be Empty' : null,
                          ),
                          controller: pincode,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      const SizedBox(width: 10.0,),
                      Expanded(
                        child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.blue,
                            ),
                            onPressed: (){},
                            child: const Row(
                              children: [
                                Icon(Icons.my_location,color: Colors.white,),
                                SizedBox(width: 10.0,),
                                Text("Use My Location",style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'AnekLatin',
                                  fontSize: 15.0,
                                ),)
                              ],
                            )),
                      )
                    ],
                  ),
                  const SizedBox(height: 10.0,),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            label: const Text("State(Required) *",style: TextStyle(
                              fontFamily: 'AnekLatin',
                              letterSpacing: 0.5,
                            ),),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2.0),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            errorText:
                            validateState ? 'State Value Can\'t Be Empty' : null,
                          ),
                          controller: state,
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      const SizedBox(width: 10.0,),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            label: const Text("City(Required) *",style: TextStyle(
                              fontFamily: 'AnekLatin',
                              letterSpacing: 0.5,
                            ),),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2.0),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            errorText:
                            validateCity ? 'City Value Can\'t Be Empty' : null,
                          ),
                          controller: city,
                          keyboardType: TextInputType.text,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10.0,),
                  TextField(
                    decoration: InputDecoration(
                      label: const Text("House No,Building Name(Required) *",style: TextStyle(
                        fontFamily: 'AnekLatin',
                        letterSpacing: 0.5,
                      ),),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2.0),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      errorText:
                      validateHouse ? 'House Number Value Can\'t Be Empty' : null,
                    ),
                    controller: houseNo,
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 10.0,),
                  TextField(
                    decoration: InputDecoration(
                      label: const Text("Road Name, Area, Colony(Required) *",style: TextStyle(
                        fontFamily: 'AnekLatin',
                        letterSpacing: 0.5,
                      ),),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2.0),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      errorText:
                      validateArea ? 'Road Name, Area, Colony Value Can\'t Be Empty' : null,
                    ),
                    controller: area,
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 10.0,),
                  const Text("Type of address",style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'AnekLatin',
                  ),),
                  const SizedBox(height: 10.0,),
                  Row(
                    children: [
                      TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(typeOfAddress == 'Home' ? Colors.blue : Colors.white),
                            side: MaterialStateProperty.resolveWith<BorderSide>((states) {
                              return const BorderSide(color: Colors.grey, width: 2.0);
                            }),
                          ),
                          onPressed: (){
                            setState(() {
                              typeOfAddress = 'Home';
                            });
                          },
                          child: const Row(
                            children: [
                              Icon(Icons.home,color: Colors.black,),
                              SizedBox(width: 10.0,),
                              Text("Home",style: TextStyle(
                                fontFamily: 'AnekLatin',
                                color: Colors.black,
                              ),)
                            ],
                          )
                      ),
                      const SizedBox(width: 10.0,),
                      TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(typeOfAddress == 'Work' ? Colors.blue : Colors.white),
                            side: MaterialStateProperty.resolveWith<BorderSide>((states) {
                              return const BorderSide(color: Colors.grey, width: 2.0);
                            }),
                          ),
                          onPressed: (){
                            setState(() {
                              typeOfAddress = 'Work';
                            });
                          },
                          child: const Row(
                            children: [
                              Icon(Icons.work_history_sharp,color: Colors.black,),
                              SizedBox(width: 10.0,),
                              Text("Work",style: TextStyle(
                                fontFamily: 'AnekLatin',
                                color: Colors.black,
                              ),)
                            ],
                          )
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0,),
                  SizedBox(
                    width: double.infinity,
                    height: 45.0,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                      ),
                      onPressed: () async{
                        setState(() {
                          name.text.isEmpty ?
                              validateName = true :
                              validateName = false;
                          phoneNum.text.isEmpty ?
                              validatePhone = true :
                              validatePhone = false;
                          pincode.text.isEmpty ?
                              validatePin = true :
                              validatePin = false;
                          state.text.isEmpty ?
                              validateState = true :
                              validateState = false;
                          city.text.isEmpty ?
                              validateCity = true :
                              validateCity = false;
                          houseNo.text.isEmpty ?
                              validateHouse = true :
                              validateHouse = false;
                          area.text.isEmpty ?
                              validateArea = true :
                              validateArea = false;
                        });
                        if(!validateName && !validatePhone && !validatePin && !validateState && !validateCity && !validateHouse && !validateArea ){
                          var addressModel = AddressModel();
                          addressModel.name = name.text;
                          addressModel.phoneNo = phoneNum.text;
                          addressModel.pincode = pincode.text;
                          addressModel.state = state.text;
                          addressModel.city = city.text;
                          addressModel.houseNo = houseNo.text;
                          addressModel.area = area.text;
                          addressModel.addressType = typeOfAddress;
                          var result = await _userService.AddAddress(addressModel);
                          if(result >= 1){
                            Fluttertoast.showToast(
                                msg: "New Address has been Added",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                            );
                            Navigator.pop(context);
                          }
                          else{
                            Fluttertoast.showToast(
                              msg: "New Address not Added",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                            );
                          }
                        }
                        else{
                          Fluttertoast.showToast(
                            msg: "Empty Fields",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                          );
                        }
                      },
                      child: const Text("Save Address",style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.8,
                        fontFamily: 'AnekLatin',
                      ),),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
