class TurfCatogery {
    TurfCatogery({
        this.turfCricket,
        this.turfFootball,
        this.turfBadminton,
        this.turfYoga,
    });

    bool?turfCricket;
    bool? turfFootball;
    bool? turfBadminton;
    bool? turfYoga;

    factory TurfCatogery.fromJson(Map<String, dynamic> json) => TurfCatogery(
        turfCricket: json["turf_cricket"],
        turfFootball: json["turf_football"],
        turfBadminton: json["turf_badminton"],
        turfYoga: json["turf_yoga"],
    );

    Map<String, dynamic> toJson() => {
        "turf_cricket": turfCricket,
        "turf_football": turfFootball,
        "turf_badminton": turfBadminton,
        "turf_yoga": turfYoga,
    };
}