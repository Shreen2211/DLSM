import 'package:dlsm/Model/User/UserData.dart';

class MyAgentData{
  final String? email;
  final String? name;
  final String? phone;
  final String? password;
  final int? id;
  final User? agentCompany;

  bool isShow=false;
  MyAgentData({this.id,this.email,this.name,this.phone,this.isShow=false,this.password,this.agentCompany});
  factory MyAgentData.fromJson({required Map<String, dynamic> jsonData}) {
    return MyAgentData(
      email: jsonData['Email'],
      name: jsonData['Name'],
      password: jsonData['Password'],
      phone: jsonData['PhoneNumber'],
      id: jsonData['id'],
      agentCompany: jsonData['shipping_companies']!= null ? User.fromJson(jsonData: jsonData['shipping_companies']) : null,
      isShow: false,
    );
  }

}
