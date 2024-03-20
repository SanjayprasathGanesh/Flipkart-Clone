import 'package:flipkart/SQLiteDB/addressModel.dart';
import 'package:flipkart/SQLiteDB/repository.dart';

class UserService{
  late Repository _repository;

  UserService(){
    _repository = Repository();
  }

  AddAddress(AddressModel addressModel) async{
    return await _repository.addAddress('user', addressModel.userAddressMap());
  }

  ReadAddress() async{
    return await _repository.readAddress('user');
  }

  UpdateAddress(AddressModel addressModel) async{
    return await _repository.updateAddress(addressModel.userAddressMap());
  }

  DeleteAddress(id) async{
    return await _repository.deleteAddress(id);
  }

  UpdateSelected(id) async{
    return await _repository.updateAddressById(id);
  }

  DeUpdateSelected(id) async{
    return await _repository.deUpdateAddressById(id);
  }

  GetUpdated() async{
    return await _repository.getSelected();
  }

}