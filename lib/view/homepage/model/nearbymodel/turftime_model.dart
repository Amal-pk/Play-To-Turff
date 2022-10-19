class TurfTime {
  TurfTime({
    this.timeMorning,
    this.timeAfternoon,
    this.timeEvening,
  });

  String? timeMorning;
  String? timeAfternoon;
  String? timeEvening;

  factory TurfTime.fromJson(Map<String, dynamic> json) => TurfTime(
        timeMorning: json["time_morning"],
        timeAfternoon: json["time_afternoon"],
        timeEvening: json["time_evening"],
      );

  Map<String, dynamic> toJson() => {
        "time_morning": timeMorning,
        "time_afternoon": timeAfternoon,
        "time_evening": timeEvening,
      };
}
