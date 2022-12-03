// To parse this JSON data, do
//
//     final productModal = productModalFromJson(jsonString);

import 'dart:convert';

ProductModal productModalFromJson(String str) =>
    ProductModal.fromJson(json.decode(str));

String productModalToJson(ProductModal data) => json.encode(data.toJson());

class ProductModal {
  ProductModal({
    this.statusCode,
    this.status,
    this.message,
    this.serverMessage,
    this.data,
  });

  int? statusCode;
  String? status;
  String? message;
  dynamic serverMessage;
  Data? data;

  factory ProductModal.fromJson(Map<String, dynamic> json) => ProductModal(
        statusCode: json["status_code"],
        status: json["status"],
        message: json["message"],
        serverMessage: json["server_message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "status": status,
        "message": message,
        "server_message": serverMessage,
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    this.products,
    this.totalRecords,
    this.pageSize,
    this.pageNo,
    this.heroImage,
  });

  List<Product>? products;
  int? totalRecords;
  int? pageSize;
  int? pageNo;
  List<HeroImage>? heroImage;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
        totalRecords: json["total_records"],
        pageSize: json["page_size"],
        pageNo: json["page_no"],
        heroImage: List<HeroImage>.from(
            json["hero_image"].map((x) => HeroImage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products!.map((x) => x.toJson())),
        "total_records": totalRecords,
        "page_size": pageSize,
        "page_no": pageNo,
        "hero_image": List<dynamic>.from(heroImage!.map((x) => x.toJson())),
      };
}

class HeroImage {
  HeroImage({
    this.desktopImage,
    this.mobileImage,
  });

  String? desktopImage;
  String? mobileImage;

  factory HeroImage.fromJson(Map<String, dynamic> json) => HeroImage(
        desktopImage: json["desktop_image"],
        mobileImage: json["mobile_image"],
      );

  Map<String, dynamic> toJson() => {
        "desktop_image": desktopImage,
        "mobile_image": mobileImage,
      };
}

class Product {
  Product({
    this.id,
    this.name,
    this.urlKey,
    this.variantAttributeGroupId,
    this.tag,
    this.rating,
    this.discountPercentage,
    this.image,
    this.mrp,
    this.salePrice,
    this.variants,
  });

  String? id;
  String? name;
  String? urlKey;
  String? variantAttributeGroupId;
  String? tag;
  int? rating;
  int? discountPercentage;
  String? image;
  int? mrp;
  int? salePrice;
  List<Variant>? variants;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        urlKey: json["url_key"],
        variantAttributeGroupId: json["variant_attribute_group_id"] == null
            ? null
            : json["variant_attribute_group_id"],
        tag: json["tag"],
        rating: json["rating"],
        discountPercentage: json["discount_percentage"],
        image: json["image"],
        mrp: json["mrp"],
        salePrice: json["sale_price"],
        variants: json["variants"] == null
            ? null
            : List<Variant>.from(
                json["variants"].map((x) => Variant.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "url_key": urlKey,
        "variant_attribute_group_id":
            variantAttributeGroupId == null ? null : variantAttributeGroupId,
        "tag": tag,
        "rating": rating,
        "discount_percentage": discountPercentage,
        "image": image,
        "mrp": mrp,
        "sale_price": salePrice,
        "variants": variants == null
            ? null
            : List<dynamic>.from(variants!.map((x) => x.toJson())),
      };
}

class Variant {
  Variant({
    this.attributeId,
    this.attributeName,
    this.attributeType,
    this.attributeOptionId,
    this.attributeOptionName,
    this.colorCode,
    this.variantAttributeGroupId,
    this.id,
    this.urlKey,
    this.mrp,
    this.salePrice,
  });

  String? attributeId;
  String? attributeName;
  String? attributeType;
  String? attributeOptionId;
  String? attributeOptionName;
  String? colorCode;
  String? variantAttributeGroupId;
  String? id;
  String? urlKey;
  int? mrp;
  int? salePrice;

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        attributeId: json["attribute_id"],
        attributeName: json["attribute_name"],
        attributeType: json["attribute_type"],
        attributeOptionId: json["attribute_option_id"],
        attributeOptionName: json["attribute_option_name"],
        colorCode: json["color_code"],
        variantAttributeGroupId: json["variant_attribute_group_id"],
        id: json["id"],
        urlKey: json["url_key"],
        mrp: json["mrp"],
        salePrice: json["sale_price"],
      );

  Map<String, dynamic> toJson() => {
        "attribute_id": attributeId,
        "attribute_name": attributeName,
        "attribute_type": attributeType,
        "attribute_option_id": attributeOptionId,
        "attribute_option_name": attributeOptionName,
        "color_code": colorCode,
        "variant_attribute_group_id": variantAttributeGroupId,
        "id": id,
        "url_key": urlKey,
        "mrp": mrp,
        "sale_price": salePrice,
      };
}
