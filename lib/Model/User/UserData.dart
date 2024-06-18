class User {
  final String? name;
  final int? id;
  final String? email;
  final int? shippingID;
  final String? address;
  final String? website;
  final String? businessHistory;
  final String? businessHours;
  final String? phoneNumber;
  final String? sSN;
  final String? nationality;
  final String? taxCard;
  final String? countryTarget;
  final String? countryDealing;
  final String? industrialRecord;
  final String? commercialRecord;
  final String? type;

  User(
      {this.id,
      this.shippingID,
      this.name,
      this.type,
      this.email,
      this.phoneNumber,
      this.website,
      this.address,
      this.businessHours,
      this.businessHistory,
      this.industrialRecord,
      this.commercialRecord,
      this.countryDealing,
      this.countryTarget,
      this.nationality,
      this.sSN,
      this.taxCard});

  factory User.fromJson({required Map<String, dynamic> jsonData, String? typeUser}) {
    return User(
      type: typeUser,
      id: jsonData['id'],
      email: jsonData['Email'],
      shippingID: jsonData['shipping_id'],
      name: jsonData['Name'],
      website: jsonData['Website'],
      phoneNumber: jsonData['PhoneNumber'],
      address: jsonData['Address'],
      businessHistory: jsonData['BusinessHistory'],
      businessHours: jsonData['BusinessHours'],
      industrialRecord: jsonData['IndustrialRecord'],
      commercialRecord: jsonData['CommercialRecord'],
      countryDealing: jsonData['CountryDealing'],
      countryTarget: jsonData['CountryTarget'],
      nationality: jsonData['Nationality'],
      sSN: jsonData['SSN'],
      taxCard: jsonData['TaxCard'],
    );
  }
}
