
import 'package:fullstackwithflutter_ui/models/user.dart';
import 'dart:convert';
import "package:http/http.dart" as http;

abstract class IUserRepository{

  Future<UserResponse> fetchUsersList();
}

class UserRepository implements IUserRepository{

final _host="https://0cfd-159-146-53-63.ngrok-free.app/api/User/";
final Map<String,String> _headers={
  "Accept":"application/json",
  "content-type":"application/json",
};

  @override
 Future<UserResponse> fetchUsersList() async{
  
  var getAllUsersUrl=_host+"GetAll";
  var results= await http.get(Uri.parse(getAllUsersUrl),headers: _headers);

  final Jsonobject = json.decode(results.body);

  var response=UserResponse.fromJson(Jsonobject);

  return response;

 }
}