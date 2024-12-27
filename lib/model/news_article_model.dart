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
  List<String>? desFacet;
  List<String>? orgFacet;
  List<String>? perFacet;
  List<String>? geoFacet;
  List<Multimedia>? multimedia;
  String? shortUrl;

  Result({
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
    this.desFacet,
    this.orgFacet,
    this.perFacet,
    this.geoFacet,
    this.multimedia,
    this.shortUrl,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    subsection: json["subsection"],
    title: json["title"],
    resultAbstract: json["abstract"],
    url: json["url"],
    uri: json["uri"],
    byline: json["byline"],
    updatedDate: json["updated_date"] == null ? null : DateTime.parse(json["updated_date"]),
    createdDate: json["created_date"] == null ? null : DateTime.parse(json["created_date"]),
    publishedDate: json["published_date"] == null ? null : DateTime.parse(json["published_date"]),
    materialTypeFacet: json["material_type_facet"],
    desFacet: json["des_facet"] == null ? [] : List<String>.from(json["des_facet"]!.map((x) => x)),
    orgFacet: json["org_facet"] == null ? [] : List<String>.from(json["org_facet"]!.map((x) => x)),
    perFacet: json["per_facet"] == null ? [] : List<String>.from(json["per_facet"]!.map((x) => x)),
    geoFacet: json["geo_facet"] == null ? [] : List<String>.from(json["geo_facet"]!.map((x) => x)),
    multimedia: json["multimedia"] == null ? [] : List<Multimedia>.from(json["multimedia"]!.map((x) => Multimedia.fromJson(x))),
    shortUrl: json["short_url"],
  );

  Map<String, dynamic> toJson() => {
    "subsection": subsection,
    "title": title,
    "abstract": resultAbstract,
    "url": url,
    "uri": uri,
    "byline": byline,
    "updated_date": updatedDate?.toIso8601String(),
    "created_date": createdDate?.toIso8601String(),
    "published_date": publishedDate?.toIso8601String(),
    "material_type_facet": materialTypeFacet,
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



class Multimedia {
  String? url;
  int? height;
  int? width;
  Type? type;
  String? caption;
  String? copyright;

  Multimedia({
    this.url,
    this.height,
    this.width,
    this.type,
    this.caption,
    this.copyright,
  });

  factory Multimedia.fromJson(Map<String, dynamic> json) => Multimedia(
    url: json["url"],
    height: json["height"],
    width: json["width"],
    caption: json["caption"],
    copyright: json["copyright"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "height": height,
    "width": width,
    "caption": caption,
    "copyright": copyright,
  };
}

