import 'package:hive_flutter/hive_flutter.dart';

part 'customer_model.g.dart';

@HiveType(typeId: 1)
class CustomerModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  String firstName;

  @HiveField(2)
  String lastName;

  @HiveField(3)
  String tcNumber;

  @HiveField(4)
  String? address;

  CustomerModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.tcNumber,
    this.address,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      tcNumber: json['tcNumber'],
      address: json['address'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "firstName": firstName,
      "lastName": lastName,
      "tcNumber": tcNumber,
      "address": address,
    };
  }
}
