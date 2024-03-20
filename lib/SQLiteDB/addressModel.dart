class AddressModel{
  int? id;
  String? name;
  String? phoneNo;
  String? pincode;
  String? state;
  String? city;
  String? houseNo;
  String? area;
  String? addressType;
  int? selected;

  userAddressMap(){
    var mapping = Map<String, dynamic>();
    mapping['id'] = id ?? null;
    mapping['name'] = name!;
    mapping['phoneNo'] = phoneNo!;
    mapping['pincode'] = pincode!;
    mapping['state'] = state!;
    mapping['city'] = city!;
    mapping['houseNo'] = houseNo!;
    mapping['area'] = area!;
    mapping['addressType'] = addressType!;
    mapping['selected'] = 0;
    return mapping;
  }
}