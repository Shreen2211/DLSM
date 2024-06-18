import '../MyAgent/ShowDataAgent.dart';

class OfferModel {
  int? id;
  int? agentsId;
  int? requestId;
  int? price;
  String? pL;
  String? tT;
  String? fT;
  String? oF;
  String? tHC;
  String? from;
  String? tO;
  int? extraFees;
  String? powerPerDay;
  int? customsPrice;
  int? truckingPrice;
  String? createdAt;
  String? updatedAt;
  MyAgentData? agent;
  bool more = false;

  OfferModel(
      {this.id,
      this.agentsId,
      this.requestId,
      this.price,
      this.pL,
      this.tT,
      this.fT,
      this.oF,
      this.tHC,
      this.from,
      this.tO,
      this.extraFees,
      this.powerPerDay,
      this.createdAt,
      this.updatedAt,
      this.customsPrice,
      this.truckingPrice,this.agent});

  factory OfferModel.fromJson(Map<String, dynamic> json) {
    return OfferModel(
      id: json['id'],
      agentsId: json['agents_id'],
      requestId: json['request_id'],
      price: json['Price'],
      pL: json['PL'],
      tT: json['TT'],
      fT: json['FT'],
      oF: json['OF'],
      tHC: json['THC'],
      from: json['From'],
      tO: json['TO'],
      extraFees: json['ExtraFees'],
      powerPerDay: json['PowerPerDay'],
      truckingPrice: json['TruckingPrice'],
      customsPrice: json['CustomsPrice'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      agent: json['agent'] != null ? MyAgentData.fromJson(jsonData: json['agent']) : null,
    );
  }
}
