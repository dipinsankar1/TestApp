class Event {
  late final String title;
  late final String posterUrl;
  Venue venue;

  //late EventPromotion eventPromotion;
  List<Performer> performers;
  DateTime createdAt;
  Event({
    required this.title,
    required this.posterUrl,
    required this.venue,
    required this.performers,
    required this.createdAt,
  });
  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      title: json["title"],
      posterUrl: json["url"],
      venue: Venue.fromJson(json["venue"]),
      // eventPromotion: EventPromotion.fromJson(json["event_promotion"]),
      performers: List<Performer>.from(
          json["performers"].map((x) => Performer.fromJson(x))),

      // datetimeLocal: json["datetime_local"],
      createdAt: DateTime.parse(json["created_at"]),
      // createdAt: json["created_at"],
    );
  }
  Map<String, dynamic> toJson() => {
        "title": title,
        "url": posterUrl,
        "venue": venue.toJson(),
        // "images": images.toJson(),
        "created_at": createdAt.toIso8601String(),
        "performers": List<dynamic>.from(performers.map((x) => x.toJson())),
      };
}

class Performer {
  Performer({
    required this.name,
    required this.image,
    required this.id,
    required this.images,
    required this.shortName,
  });

  String name;
  String image;
  int id;
  PerformerImages images;
  String shortName;

  factory Performer.fromJson(Map<String, dynamic> json) => Performer(
        name: json["name"],
        image: json["image"],
        id: json["id"],
        images: PerformerImages.fromJson(json["images"]),
        shortName: json["short_name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "id": id,
        "images": images.toJson(),
        "short_name": shortName,
      };
}

class PerformerImages {
  PerformerImages({
    required this.huge,
  });

  String huge;

  factory PerformerImages.fromJson(Map<String, dynamic> json) =>
      PerformerImages(
        huge: json["huge"],
      );

  Map<String, dynamic> toJson() => {
        "huge": huge,
      };
}

class Venue {
  Venue({
    required this.displayLocation,
  });

  String displayLocation;

  factory Venue.fromJson(Map<String, dynamic> json) => Venue(
        displayLocation: json["display_location"],
      );

  Map<String, dynamic> toJson() => {
        "display_location": displayLocation,
      };
}

class EventPromotion {
  EventPromotion({
    required this.headline,
    required this.additionalInfo,
    required this.images,
  });

  String headline;
  String additionalInfo;
  EventPromotionImages images;

  factory EventPromotion.fromJson(Map<String, dynamic> json) => EventPromotion(
        headline: json["headline"],
        additionalInfo: json["additional_info"],
        images: EventPromotionImages.fromJson(json["images"]),
      );

  Map<String, dynamic> toJson() => {
        "headline": headline,
        "additional_info": additionalInfo,
        "images": images.toJson(),
      };
}

class EventPromotionImages {
  EventPromotionImages({
    required this.icon,
    required this.png2X,
    required this.png3X,
  });

  String icon;
  String png2X;
  String png3X;

  factory EventPromotionImages.fromJson(Map<String, dynamic> json) =>
      EventPromotionImages(
        icon: json["icon"],
        png2X: json["png@2x"],
        png3X: json["png@3x"],
      );

  Map<String, dynamic> toJson() => {
        "icon": icon,
        "png@2x": png2X,
        "png@3x": png3X,
      };
}
