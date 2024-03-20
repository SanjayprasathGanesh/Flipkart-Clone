import 'package:flipkart/SQLiteDB/addressModel.dart';
import 'package:flipkart/SQLiteDB/userService.dart';
import 'package:flipkart/screens/editaddress.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'addAddress.dart';

class ChangeAddress extends StatefulWidget {
  const ChangeAddress({super.key});

  @override
  State<ChangeAddress> createState() => _ChangeAddressState();
}

class _ChangeAddressState extends State<ChangeAddress> {

  List<AddressModel> addressList = <AddressModel>[];
  UserService _userService = UserService();

  String selected = '';
  bool isSelected = false;

  // int selected = -1;

  int selectedRadio = -1;
  int selectedId = 0;

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  initState(){
    super.initState();
    getAllAddress();
    showAllAddress(context);
    selectedRadio = -1;
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
        addressModel.selected = addresses['selected'];
        addressList.add(addressModel);
      });
    });
  }

  showAllAddress(BuildContext context){

    return ListView.builder(
      itemCount: addressList.length,
      itemBuilder: (context,index){

        String address = '${addressList[index].houseNo!}, ${addressList[index].area!}, ${addressList[index].city!}, ${addressList[index].state!}.';

        return Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 10,
          margin: const EdgeInsets.only(bottom: 10,top: 10),
          child: ListTile(
            contentPadding: const EdgeInsets.all(8.0),
            leading: Radio(
              value: index,
              groupValue: selectedRadio,
              onChanged: (val) {
                selectedId = addressList[index].id!;
                print(selectedId);
                setSelectedRadio(val!);
              },
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(addressList[index].name!,style: const TextStyle(
                          fontFamily: 'AnekLatin',
                          fontSize: 15.0,
                          color: Colors.black,
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
                            fontSize: 15.0,
                            color: Colors.black,
                          ),),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        TextButton(
                            onPressed: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditAddress(addressModel: addressList[index],))).then((data){
                                if(data != null){
                                  getAllAddress();
                                }
                              });
                            },
                            child: const Text("Edit",style: TextStyle(
                              color: Colors.blue,
                            ),)
                        ),
                        IconButton(
                            onPressed: (){
                              deleteAddress(addressList[index].id!);
                            },
                            icon: const Icon(Icons.delete_outline,color: Colors.red,size: 18.0,),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 10.0,),
                Text(address,style: const TextStyle(
                  fontFamily: 'AnekLatin',
                  fontSize: 15.0,
                  color: Colors.black,
                ),),
                const SizedBox(height: 10.0,),
                Text(addressList[index].phoneNo!,style: const TextStyle(
                  fontFamily: 'AnekLatin',
                  fontSize: 15.0,
                  color: Colors.black,
                ),),
                // const SizedBox(height: 10.0,),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    setState(() {
      getAllAddress();
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Address"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
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
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const AddAddress()));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddAddress())).then((data){
                        if(data != null){
                          getAllAddress();
                        }
                      });
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.add,color: Colors.blue,size: 18.0,),
                        SizedBox(width: 10.0,),
                        Text("Add a New Address",style: TextStyle(
                          color: Colors.blue,
                          fontFamily: 'AnekLatin',
                        ),),
                      ],
                    ),
                  )
                ),
                SizedBox(
                  height: 500,
                  width: double.infinity,
                  child: showAllAddress(context),
                ),
              ],
            ),
          ),
        ],
      ),
      persistentFooterButtons: [
        TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.green,
            ),
            onPressed: (){
              print(selectedId);
              _userService.UpdateSelected(selectedId);
              _userService.DeUpdateSelected(selectedId);
            },
            child: const Text("Confirm",style: TextStyle(
              color: Colors.white,
              fontFamily: 'AnekLatin',
              fontSize: 15.0,
            ),)
        )
      ],
    );
  }
  
  deleteAddress(int id){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: const Text("Do You want to remove this Address",style: TextStyle(
              color: Colors.black,
              fontFamily: 'AnekLatin',
              fontSize: 17.0,
            ),),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    onPressed: (){
                      _userService.DeleteAddress(id);
                      Fluttertoast.showToast(
                          msg: 'Address Removed'
                      );
                      setState(() {
                          getAllAddress();
                          Navigator.pop(context);
                      });
                    },
                    child: const Text("Delete")
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel")
                )
              ],
            ),
          );
        }
    );
  }
}
