import 'package:dlsm/Model/User/UserData.dart';

class FeedbackModel{
  int? id;
  String? message;
  String? rate;
  int? shippingCompanyId;
  int? clientId;
  String? createdAt;
  String? updatedAt;
  User? client;
  FeedbackModel({this.client,this.id,this.shippingCompanyId,this.rate,this.createdAt,this.message,this.updatedAt,this.clientId});
  factory FeedbackModel.fromJson({required Map<String, dynamic> jsonData}) {
    return FeedbackModel(
      id: jsonData['id'],
      message: jsonData['message'],
      rate: jsonData['rate'],
      shippingCompanyId: jsonData['shipping_company_id'],
      clientId: jsonData['client_id'],
      createdAt: jsonData['created_at'],
      updatedAt: jsonData['updated_at'],
      client: jsonData['client']!= null ? User.fromJson(jsonData: jsonData['client']) : null,
    );
  }
}