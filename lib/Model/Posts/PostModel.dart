import '../User/UserData.dart';

class PostModel {
  int? id;
  String? data;
  int? shippingCompaniesId;
  String? createdAt;
  String? updatedAt;
  User? client;
  PostModel({this.id,
    this.data,
    this.shippingCompaniesId,
    this.createdAt,
    this.updatedAt,this.client});

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      data: json['data'],
      shippingCompaniesId: json['shipping_companies_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      client :json['shipping_companies'] != null ? User.fromJson(jsonData: json['shipping_companies']) : null,
    );
  }
}