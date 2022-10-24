import 'package:turf_app/view/homepage/model/nearbymodel/datum_model.dart';

class HomeResponse {
  HomeResponse({
    this.status,
    this.data,
  });

  bool? status;
  List<Datum>? data;

  factory HomeResponse.fromJson(Map<String, dynamic> json) => HomeResponse(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );
}
