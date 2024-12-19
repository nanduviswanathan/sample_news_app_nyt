// To parse this JSON data, do
//
//     final newsArticleModel = newsArticleModelFromJson(jsonString);

import 'dart:convert';

NewsArticleModel newsArticleModelFromJson(String str) => NewsArticleModel.fromJson(json.decode(str));

String newsArticleModelToJson(NewsArticleModel data) => json.encode(data.toJson());

class NewsArticleModel {
  String? status;
  String? copyright;
  String? section;
  DateTime? lastUpdated;
  int? numResults;
  List<Result>? results;

  NewsArticleModel({
    this.status,
    this.copyright,
    this.section,
    this.lastUpdated,
    this.numResults,
    this.results,
  });

  factory NewsArticleModel.fromJson(Map<String, dynamic> json) => NewsArticleModel(
    status: json["status"],
    copyright: json["copyright"],
    section: json["section"],
    lastUpdated: json["last_updated"] == null ? null : DateTime.parse(json["last_updated"]),
    numResults: json["num_results"],
    results: json["results"] == null ? [] : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "copyright": copyright,
    "section": section,
    "last_updated": lastUpdated?.toIso8601String(),
    "num_results": numResults,
    "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
  };
}

class Result {
  String? section;
  String? subsection;
  String? title;
  String? resultAbstract;
  String? url;
  String? uri;
  String? byline;
  ItemType? itemType;
  DateTime? updatedDate;
  DateTime? createdDate;
  DateTime? publishedDate;
  String? materialTypeFacet;
  Kicker? kicker;
  List<String>? desFacet;
  List<String>? orgFacet;
  List<String>? perFacet;
  List<String>? geoFacet;
  List<Multimedia>? multimedia;
  String? shortUrl;

  Result({
    this.section,
    this.subsection,
    this.title,
    this.resultAbstract,
    this.url,
    this.uri,
    this.byline,
    this.itemType,
    this.updatedDate,
    this.createdDate,
    this.publishedDate,
    this.materialTypeFacet,
    this.kicker,
    this.desFacet,
    this.orgFacet,
    this.perFacet,
    this.geoFacet,
    this.multimedia,
    this.shortUrl,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    section: json["section"],
    subsection: json["subsection"],
    title: json["title"],
    resultAbstract: json["abstract"],
    url: json["url"],
    uri: json["uri"],
    byline: json["byline"],
    itemType: itemTypeValues.map[json["item_type"]]!,
    updatedDate: json["updated_date"] == null ? null : DateTime.parse(json["updated_date"]),
    createdDate: json["created_date"] == null ? null : DateTime.parse(json["created_date"]),
    publishedDate: json["published_date"] == null ? null : DateTime.parse(json["published_date"]),
    materialTypeFacet: json["material_type_facet"],
    kicker: kickerValues.map[json["kicker"]]!,
    desFacet: json["des_facet"] == null ? [] : List<String>.from(json["des_facet"]!.map((x) => x)),
    orgFacet: json["org_facet"] == null ? [] : List<String>.from(json["org_facet"]!.map((x) => x)),
    perFacet: json["per_facet"] == null ? [] : List<String>.from(json["per_facet"]!.map((x) => x)),
    geoFacet: json["geo_facet"] == null ? [] : List<String>.from(json["geo_facet"]!.map((x) => x)),
    multimedia: json["multimedia"] == null ? [] : List<Multimedia>.from(json["multimedia"]!.map((x) => Multimedia.fromJson(x))),
    shortUrl: json["short_url"],
  );

  Map<String, dynamic> toJson() => {
    "section": section,
    "subsection": subsection,
    "title": title,
    "abstract": resultAbstract,
    "url": url,
    "uri": uri,
    "byline": byline,
    "item_type": itemTypeValues.reverse[itemType],
    "updated_date": updatedDate?.toIso8601String(),
    "created_date": createdDate?.toIso8601String(),
    "published_date": publishedDate?.toIso8601String(),
    "material_type_facet": materialTypeFacet,
    "kicker": kickerValues.reverse[kicker],
    "des_facet": desFacet == null ? [] : List<dynamic>.from(desFacet!.map((x) => x)),
    "org_facet": orgFacet == null ? [] : List<dynamic>.from(orgFacet!.map((x) => x)),
    "per_facet": perFacet == null ? [] : List<dynamic>.from(perFacet!.map((x) => x)),
    "geo_facet": geoFacet == null ? [] : List<dynamic>.from(geoFacet!.map((x) => x)),
    "multimedia": multimedia == null ? [] : List<dynamic>.from(multimedia!.map((x) => x.toJson())),
    "short_url": shortUrl,
  };
}

enum ItemType {
  ARTICLE,
  INTERACTIVE
}

final itemTypeValues = EnumValues({
  "Article": ItemType.ARTICLE,
  "Interactive": ItemType.INTERACTIVE
});

enum Kicker {
  EMPTY,
  GLOBAL_HEALTH,
  KICKER_NEWS_ANALYSIS,
  NEWS_ANALYSIS
}

final kickerValues = EnumValues({
  "": Kicker.EMPTY,
  "Global Health": Kicker.GLOBAL_HEALTH,
  "News Analysis": Kicker.KICKER_NEWS_ANALYSIS,
  "news analysis": Kicker.NEWS_ANALYSIS
});

class Multimedia {
  String? url;
  Format? format;
  int? height;
  int? width;
  Type? type;
  Subtype? subtype;
  String? caption;
  String? copyright;

  Multimedia({
    this.url,
    this.format,
    this.height,
    this.width,
    this.type,
    this.subtype,
    this.caption,
    this.copyright,
  });

  factory Multimedia.fromJson(Map<String, dynamic> json) => Multimedia(
    url: json["url"],
    format: formatValues.map[json["format"]]!,
    height: json["height"],
    width: json["width"],
    type: typeValues.map[json["type"]]!,
    subtype: subtypeValues.map[json["subtype"]]!,
    caption: json["caption"],
    copyright: json["copyright"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "format": formatValues.reverse[format],
    "height": height,
    "width": width,
    "type": typeValues.reverse[type],
    "subtype": subtypeValues.reverse[subtype],
    "caption": caption,
    "copyright": copyright,
  };
}

enum Format {
  LARGE_THUMBNAIL,
  SUPER_JUMBO,
  THREE_BY_TWO_SMALL_AT2_X,
  WIDE_THUMBNAIL
}

final formatValues = EnumValues({
  "Large Thumbnail": Format.LARGE_THUMBNAIL,
  "Super Jumbo": Format.SUPER_JUMBO,
  "threeByTwoSmallAt2X": Format.THREE_BY_TWO_SMALL_AT2_X,
  "Wide Thumbnail": Format.WIDE_THUMBNAIL
});

enum Subtype {
  PHOTO
}

final subtypeValues = EnumValues({
  "photo": Subtype.PHOTO
});

enum Type {
  IMAGE
}

final typeValues = EnumValues({
  "image": Type.IMAGE
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
