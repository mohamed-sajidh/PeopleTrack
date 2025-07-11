class PersonalDetailsModel {
  int userId;
  String firstName;
  String lastName;
  String address;
  String state;
  String postcode;
  String country;
  String contactNumber;
  int status;
  List<RoleDetails>? roleDetails;

  PersonalDetailsModel({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.address,
    required this.state,
    required this.postcode,
    required this.country,
    required this.contactNumber,
    required this.status,
    required this.roleDetails,
  });

  factory PersonalDetailsModel.fromJson(Map<String, dynamic> json) {
    return PersonalDetailsModel(
      userId: json['id'] ?? 0,
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      address: json['address'] ?? '',
      state: json['state'] ?? '',
      postcode: json['postcode'] ?? '',
      country: json['country'] ?? '',
      contactNumber: json['contact_number'] ?? '',
      status: json['status'] ?? 0,
      roleDetails: (json['role_details'] as List<dynamic>?)
          ?.map((e) => RoleDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': userId,
      'first_name': firstName,
      'last_name': lastName,
      'address': address,
      'state': state,
      'postcode': postcode,
      'country': country,
      'contact_number': contactNumber,
      'status': status,
      'role_details': roleDetails?.map((e) => e.toJson()).toList(),
    };
  }
}

class RoleDetails {
  int id;
  String role;

  RoleDetails({
    required this.id,
    required this.role,
  });

  factory RoleDetails.fromJson(Map<String, dynamic> json) {
    return RoleDetails(
      id: json['id'] ?? 0,
      role: json['role'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'role': role,
    };
  }
}
