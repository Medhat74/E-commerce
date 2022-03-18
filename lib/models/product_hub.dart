import 'package:flutter/cupertino.dart';

class ProductHub {
  int? status;
  String? message;
  List<Data>? data;

  ProductHub({this.status, this.message, this.data});

  ProductHub.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? categoryId;
  String? name;
  int? price;
  int? qty;
  Image? image;
  int? offer;
  int? tax;
  String? createdAt;
  String? updatedAt;
  int ordarCategory = 0;


  Data(
      { this.id,
        this.categoryId,
        this.name,
        this.price,
        this.qty,
        this.image,
        this.offer,
        this.tax,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    name = json['name'];
    price = json['price'];
    qty = json['qty'];
    image = json['image'];
    offer = json['offer'];
    tax = json['tax'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['name'] = this.name;
    data['price'] = this.price;
    data['qty'] = this.qty;
    data['image'] = this.image;
    data['offer'] = this.offer;
    data['tax'] = this.tax;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}