import '../User/UserData.dart';

class RequestModel {
  int? id;
  int? clientId;
  String? location;
  String? locationTwo;
  String? destination;
  String? destinationTwo;
  String? comment;
  String? goodsType;
  String? safety;
  int? weight;
  int? length;
  int? width;
  int? height;
  String? range;
  String? country;
  String? extraFees;
  String? preferType;
  String? typesOfTruck;
  String? weightOfSingleCarton;
  String? containerTypeAndSize;
  String? numberOfContainer;
  String? numberOfCartons;
  String? typeOfRequest;
  String? typeOfInternational;
  int? accept;
  int? acceptId;
  int? done;
  int? tracking;
  int? customClearance;
  User? client;

  RequestModel(
      {this.id,
      this.client,
      this.clientId,
      this.location,
      this.destination,
      this.comment,
      this.goodsType,
      this.acceptId,
      this.safety,
      this.weight,
      this.length,
      this.width,
      this.height,
      this.range,
      this.country,
      this.extraFees,
      this.preferType,
      this.typesOfTruck,
      this.weightOfSingleCarton,
      this.containerTypeAndSize,
      this.numberOfContainer,
      this.numberOfCartons,
      this.typeOfRequest,
      this.typeOfInternational,
      this.accept,
      this.done,
      this.tracking,
      this.customClearance,
      this.destinationTwo,
      this.locationTwo});

  factory RequestModel.fromJson(Map<String, dynamic> json) {
    return RequestModel(
      id: json['id'],
      clientId: json['client_id'],
      location: json['Location'],
      destination: json['Destination'],
      locationTwo: json['Location2'],
      destinationTwo: json['Destination2'],
      comment: json['Comment'],
      goodsType: json['GoodsType'],
      safety: json['Safety'],
      weight: json['Weight'],
      length: json['Length'],
      width: json['Width'],
      height: json['Height'],
      range: json['Range'],
      country: json['Country'],
      extraFees: json['ExtraFees'],
      preferType: json['PreferType'],
      typesOfTruck: json['TypesOfTruck'],
      weightOfSingleCarton: json['WeightOfSingleCarton'],
      containerTypeAndSize: json['ContainerTypeAndSize'],
      numberOfContainer: json['NumberOfContainer'],
      numberOfCartons: json['NumberOfCartons'],
      typeOfRequest: json['TypeOfRequest'],
      typeOfInternational: json['TypeOfInternational'],
      accept: json['ACCEPT'],
      acceptId: json['ACCEPT_ID'],
      done: json['DONE'],
      customClearance: json['CustomsClearness'],
      tracking: json['Tracking'],
      client :json['client'] != null ? User.fromJson(jsonData: json['client']) : null,
    );
  }
}
