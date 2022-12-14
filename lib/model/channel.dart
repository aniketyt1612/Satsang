// To parse this JSON data, do
//
//     final userAccount = userAccountFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UserAccount userAccountFromJson(String str) => UserAccount.fromJson(json.decode(str));

String userAccountToJson(UserAccount data) => json.encode(data.toJson());

class UserAccount {
    UserAccount({
        required this.kind,
        required this.etag,
        required this.pageInfo,
        required this.items,
    });

    final String kind;
    final String etag;
    final PageInfo pageInfo;
    final List<Item> items;

    factory UserAccount.fromJson(Map<String, dynamic> json) => UserAccount(
        kind: json["kind"],
        etag: json["etag"],
        pageInfo: PageInfo.fromJson(json["pageInfo"]),
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "kind": kind,
        "etag": etag,
        "pageInfo": pageInfo.toJson(),
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
    };
}

class Item {
    Item({
        required this.kind,
        required this.etag,
        required this.id,
        required this.snippet,
        required this.contentDetails,
        required this.statistics,
    });

    final String kind;
    final String etag;
    final String id;
    final Snippet snippet;
    final ContentDetails contentDetails;
    final Statistics statistics;

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        kind: json["kind"],
        etag: json["etag"],
        id: json["id"],
        snippet: Snippet.fromJson(json["snippet"]),
        contentDetails: ContentDetails.fromJson(json["contentDetails"]),
        statistics: Statistics.fromJson(json["statistics"]),
    );

    Map<String, dynamic> toJson() => {
        "kind": kind,
        "etag": etag,
        "id": id,
        "snippet": snippet.toJson(),
        "contentDetails": contentDetails.toJson(),
        "statistics": statistics.toJson(),
    };
}

class ContentDetails {
    ContentDetails({
        required this.relatedPlaylists,
    });

    final RelatedPlaylists relatedPlaylists;

    factory ContentDetails.fromJson(Map<String, dynamic> json) => ContentDetails(
        relatedPlaylists: RelatedPlaylists.fromJson(json["relatedPlaylists"]),
    );

    Map<String, dynamic> toJson() => {
        "relatedPlaylists": relatedPlaylists.toJson(),
    };
}

class RelatedPlaylists {
    RelatedPlaylists({
        required this.likes,
        required this.uploads,
    });

    final String likes;
    final String uploads;

    factory RelatedPlaylists.fromJson(Map<String, dynamic> json) => RelatedPlaylists(
        likes: json["likes"],
        uploads: json["uploads"],
    );

    Map<String, dynamic> toJson() => {
        "likes": likes,
        "uploads": uploads,
    };
}

class Snippet {
    Snippet({
        required this.title,
        required this.description,
        required this.customUrl,
        required this.publishedAt,
        required this.thumbnails,
        required this.localized,
        required this.country,
    });

    final String title;
    final String description;
    final String customUrl;
    final DateTime publishedAt;
    final Thumbnails thumbnails;
    final Localized localized;
    final String country;

    factory Snippet.fromJson(Map<String, dynamic> json) => Snippet(
        title: json["title"],
        description: json["description"],
        customUrl: json["customUrl"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        thumbnails: Thumbnails.fromJson(json["thumbnails"]),
        localized: Localized.fromJson(json["localized"]),
        country: json["country"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "customUrl": customUrl,
        "publishedAt": publishedAt.toIso8601String(),
        "thumbnails": thumbnails.toJson(),
        "localized": localized.toJson(),
        "country": country,
    };
}

class Localized {
    Localized({
        required this.title,
        required this.description,
    });

    final String title;
    final String description;

    factory Localized.fromJson(Map<String, dynamic> json) => Localized(
        title: json["title"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
    };
}

class Thumbnails {
    Thumbnails({
        required this.thumbnailsDefault,
        required this.medium,
        required this.high,
    });

    final Default thumbnailsDefault;
    final Default medium;
    final Default high;

    factory Thumbnails.fromJson(Map<String, dynamic> json) => Thumbnails(
        thumbnailsDefault: Default.fromJson(json["default"]),
        medium: Default.fromJson(json["medium"]),
        high: Default.fromJson(json["high"]),
    );

    Map<String, dynamic> toJson() => {
        "default": thumbnailsDefault.toJson(),
        "medium": medium.toJson(),
        "high": high.toJson(),
    };
}

class Default {
    Default({
        required this.url,
        required this.width,
        required this.height,
    });

    final String url;
    final int width;
    final int height;

    factory Default.fromJson(Map<String, dynamic> json) => Default(
        url: json["url"],
        width: json["width"],
        height: json["height"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "width": width,
        "height": height,
    };
}

class Statistics {
    Statistics({
        required this.viewCount,
        required this.subscriberCount,
        required this.hiddenSubscriberCount,
        required this.videoCount,
    });

    final String viewCount;
    final String subscriberCount;
    final bool hiddenSubscriberCount;
    final String videoCount;

    factory Statistics.fromJson(Map<String, dynamic> json) => Statistics(
        viewCount: json["viewCount"],
        subscriberCount: json["subscriberCount"],
        hiddenSubscriberCount: json["hiddenSubscriberCount"],
        videoCount: json["videoCount"],
    );

    Map<String, dynamic> toJson() => {
        "viewCount": viewCount,
        "subscriberCount": subscriberCount,
        "hiddenSubscriberCount": hiddenSubscriberCount,
        "videoCount": videoCount,
    };
}

class PageInfo {
    PageInfo({
        required this.totalResults,
        required this.resultsPerPage,
    });

    final int totalResults;
    final int resultsPerPage;

    factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
        totalResults: json["totalResults"],
        resultsPerPage: json["resultsPerPage"],
    );

    Map<String, dynamic> toJson() => {
        "totalResults": totalResults,
        "resultsPerPage": resultsPerPage,
    };
}
