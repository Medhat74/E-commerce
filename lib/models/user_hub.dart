class UserHub {
  String? name;
  String? email;
  String? address;
  String? phone;
  String? image;
  dynamic emailVerified;

  UserHub({this.name,
    this.email,
    this.address,
    this.phone,
    this.image,
    this.emailVerified});

  UserHub.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    address = json['address'];
    phone = json['phone'];
    image = json['image'];
    emailVerified = json['email verified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['image'] = this.image;
    data['email verified'] = this.emailVerified;
    return data;
  }

}