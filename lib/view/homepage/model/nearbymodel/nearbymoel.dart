import 'package:turf_app/view/homepage/model/nearbymodel/datum_model.dart';

class NearbyResponse {
  NearbyResponse({
    this.status,
    this.data,
  });

  bool? status;
  List<Datum>? data;

  factory NearbyResponse.fromJson(Map<String, dynamic> json) => NearbyResponse(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}
