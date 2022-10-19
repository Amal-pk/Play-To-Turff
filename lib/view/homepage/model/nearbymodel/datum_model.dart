import 'package:turf_app/view/homepage/model/nearbymodel/turf_catogery_model.dart';
import 'package:turf_app/view/homepage/model/nearbymodel/turfaminities_model.dart';
import 'package:turf_app/view/homepage/model/nearbymodel/turfimage_model.dart';
import 'package:turf_app/view/homepage/model/nearbymodel/turfinfo_model.dart';
import 'package:turf_app/view/homepage/model/nearbymodel/turftime_model.dart';
import 'package:turf_app/view/homepage/model/nearbymodel/turftype_model.dart';

class Datum {
  Datum({
    this.turfType,
    this.turfInfo,
    this.turfAmenities,
    this.turfImages,
    this.turfTime,
    this.id,
    this.turfCreatorId,
    this.turfName,
    this.turfPlace,
    this.turfMuncipality,
    this.turfDistrict,
    this.turfCatogery,
    this.v,
  });

  TurfType? turfType;
  TurfInfo? turfInfo;
  TurfAmenities? turfAmenities;
  TurfImages? turfImages;
  TurfTime? turfTime;
  String? id;
  String? turfCreatorId;
  String? turfName;
  String? turfPlace;
  String? turfMuncipality;
  String? turfDistrict;
  TurfCatogery? turfCatogery;
  int? v;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        turfType: TurfType.fromJson(json["turf_type"]),
        turfInfo: TurfInfo.fromJson(json["turf_info"]),
        turfAmenities: TurfAmenities.fromJson(json["turf_amenities"]),
        turfImages: TurfImages.fromJson(json["turf_images"]),
        turfTime: TurfTime.fromJson(json["turf_time"]),
        id: json["_id"],
        turfCreatorId: json["turf_creator_id"],
        turfName: json["turf_name"],
        turfPlace: json["turf_place"],
        turfMuncipality: json["turf_muncipality"],
        turfDistrict: json["turf_district"],
        turfCatogery: TurfCatogery.fromJson(json["turf_catogery"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "turf_type": turfType!.toJson(),
        "turf_info": turfInfo!.toJson(),
        "turf_amenities": turfAmenities!.toJson(),
        "turf_images": turfImages!.toJson(),
        "turf_time": turfTime!.toJson(),
        "_id": id,
        "turf_creator_id": turfCreatorId,
        "turf_name": turfName,
        "turf_place": turfPlace,
        "turf_muncipality": turfMuncipality,
        "turf_district": turfDistrict,
        "turf_catogery": turfCatogery!.toJson(),
        "__v": v,
      };
}
