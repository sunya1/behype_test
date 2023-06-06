// To parse this JSON data, do
//
//     final unsplashCollections = unsplashCollectionsFromJson(jsonString);

import 'dart:convert';

List<UnsplashCollection> unsplashCollectionsFromJson(dynamic str) => List<UnsplashCollection>.from(str.map((x) => UnsplashCollection.fromJson(x)));

String unsplashCollectionsToJson(List<UnsplashCollection> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UnsplashCollection {
    String id;
    String title;
    String? description;
    DateTime publishedAt;
    DateTime lastCollectedAt;
    DateTime updatedAt;
    bool curated;
    bool featured;
    int totalPhotos;
    bool private;
    String shareKey;
    List<Tag> tags;
    UnsplashCollectionLinks links;
    User user;
    UnsplashCollectionCoverPhoto coverPhoto;
    List<PreviewPhoto> previewPhotos;

    UnsplashCollection({
        required this.id,
        required this.title,
        this.description,
        required this.publishedAt,
        required this.lastCollectedAt,
        required this.updatedAt,
        required this.curated,
        required this.featured,
        required this.totalPhotos,
        required this.private,
        required this.shareKey,
        required this.tags,
        required this.links,
        required this.user,
        required this.coverPhoto,
        required this.previewPhotos,
    });

    factory UnsplashCollection.fromJson(Map<String, dynamic> json) => UnsplashCollection(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        publishedAt: DateTime.parse(json["published_at"]),
        lastCollectedAt: DateTime.parse(json["last_collected_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        curated: json["curated"],
        featured: json["featured"],
        totalPhotos: json["total_photos"],
        private: json["private"],
        shareKey: json["share_key"],
        tags: List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
        links: UnsplashCollectionLinks.fromJson(json["links"]),
        user: User.fromJson(json["user"]),
        coverPhoto: UnsplashCollectionCoverPhoto.fromJson(json["cover_photo"]),
        previewPhotos: List<PreviewPhoto>.from(json["preview_photos"].map((x) => PreviewPhoto.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "published_at": publishedAt.toIso8601String(),
        "last_collected_at": lastCollectedAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "curated": curated,
        "featured": featured,
        "total_photos": totalPhotos,
        "private": private,
        "share_key": shareKey,
        "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
        "links": links.toJson(),
        "user": user.toJson(),
        "cover_photo": coverPhoto.toJson(),
        "preview_photos": List<dynamic>.from(previewPhotos.map((x) => x.toJson())),
    };
}

class UnsplashCollectionCoverPhoto {
    String id;
    String slug;
    DateTime createdAt;
    DateTime updatedAt;
    DateTime? promotedAt;
    int width;
    int height;
    String color;
    String blurHash;
    String? description;
    String altDescription;
    Urls urls;
    CoverPhotoLinks links;
    int likes;
    bool likedByUser;
    List<dynamic> currentUserCollections;
    dynamic sponsorship;
    TopicSubmissions topicSubmissions;
    User user;

    UnsplashCollectionCoverPhoto({
        required this.id,
        required this.slug,
        required this.createdAt,
        required this.updatedAt,
        this.promotedAt,
        required this.width,
        required this.height,
        required this.color,
        required this.blurHash,
        this.description,
        required this.altDescription,
        required this.urls,
        required this.links,
        required this.likes,
        required this.likedByUser,
        required this.currentUserCollections,
        this.sponsorship,
        required this.topicSubmissions,
        required this.user,
    });

    factory UnsplashCollectionCoverPhoto.fromJson(Map<String, dynamic> json) => UnsplashCollectionCoverPhoto(
        id: json["id"],
        slug: json["slug"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        promotedAt: json["promoted_at"] == null ? null : DateTime.parse(json["promoted_at"]),
        width: json["width"],
        height: json["height"],
        color: json["color"],
        blurHash: json["blur_hash"],
        description: json["description"],
        altDescription: json["alt_description"],
        urls: Urls.fromJson(json["urls"]),
        links: CoverPhotoLinks.fromJson(json["links"]),
        likes: json["likes"],
        likedByUser: json["liked_by_user"],
        currentUserCollections: List<dynamic>.from(json["current_user_collections"].map((x) => x)),
        sponsorship: json["sponsorship"],
        topicSubmissions: TopicSubmissions.fromJson(json["topic_submissions"]),
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "promoted_at": promotedAt?.toIso8601String(),
        "width": width,
        "height": height,
        "color": color,
        "blur_hash": blurHash,
        "description": description,
        "alt_description": altDescription,
        "urls": urls.toJson(),
        "links": links.toJson(),
        "likes": likes,
        "liked_by_user": likedByUser,
        "current_user_collections": List<dynamic>.from(currentUserCollections.map((x) => x)),
        "sponsorship": sponsorship,
        "topic_submissions": topicSubmissions.toJson(),
        "user": user.toJson(),
    };
}

class CoverPhotoLinks {
    String self;
    String html;
    String download;
    String downloadLocation;

    CoverPhotoLinks({
        required this.self,
        required this.html,
        required this.download,
        required this.downloadLocation,
    });

    factory CoverPhotoLinks.fromJson(Map<String, dynamic> json) => CoverPhotoLinks(
        self: json["self"],
        html: json["html"],
        download: json["download"],
        downloadLocation: json["download_location"],
    );

    Map<String, dynamic> toJson() => {
        "self": self,
        "html": html,
        "download": download,
        "download_location": downloadLocation,
    };
}

class TopicSubmissions {
    ArchitectureInterior? artsCulture;
    ArchitectureInterior? businessWork;
    ArchitectureInterior? interiors;
    ArchitectureInterior? architectureInterior;

    TopicSubmissions({
        this.artsCulture,
        this.businessWork,
        this.interiors,
        this.architectureInterior,
    });

    factory TopicSubmissions.fromJson(Map<String, dynamic> json) => TopicSubmissions(
        artsCulture: json["arts-culture"] == null ? null : ArchitectureInterior.fromJson(json["arts-culture"]),
        businessWork: json["business-work"] == null ? null : ArchitectureInterior.fromJson(json["business-work"]),
        interiors: json["interiors"] == null ? null : ArchitectureInterior.fromJson(json["interiors"]),
        architectureInterior: json["architecture-interior"] == null ? null : ArchitectureInterior.fromJson(json["architecture-interior"]),
    );

    Map<String, dynamic> toJson() => {
        "arts-culture": artsCulture?.toJson(),
        "business-work": businessWork?.toJson(),
        "interiors": interiors?.toJson(),
        "architecture-interior": architectureInterior?.toJson(),
    };
}

class ArchitectureInterior {
    Status status;
    DateTime approvedOn;

    ArchitectureInterior({
        required this.status,
        required this.approvedOn,
    });

    factory ArchitectureInterior.fromJson(Map<String, dynamic> json) => ArchitectureInterior(
        status: statusValues.map[json["status"]]!,
        approvedOn: DateTime.parse(json["approved_on"]),
    );

    Map<String, dynamic> toJson() => {
        "status": statusValues.reverse[status],
        "approved_on": approvedOn.toIso8601String(),
    };
}

enum Status { APPROVED }

final statusValues = EnumValues({
    "approved": Status.APPROVED
});

class Urls {
    String raw;
    String full;
    String regular;
    String small;
    String thumb;
    String smallS3;

    Urls({
        required this.raw,
        required this.full,
        required this.regular,
        required this.small,
        required this.thumb,
        required this.smallS3,
    });

    factory Urls.fromJson(Map<String, dynamic> json) => Urls(
        raw: json["raw"],
        full: json["full"],
        regular: json["regular"],
        small: json["small"],
        thumb: json["thumb"],
        smallS3: json["small_s3"],
    );

    Map<String, dynamic> toJson() => {
        "raw": raw,
        "full": full,
        "regular": regular,
        "small": small,
        "thumb": thumb,
        "small_s3": smallS3,
    };
}

class User {
    String id;
    DateTime updatedAt;
    String username;
    String name;
    String firstName;
    String? lastName;
    String? twitterUsername;
    String? portfolioUrl;
    String? bio;
    String? location;
    UserLinks links;
    ProfileImage profileImage;
    String? instagramUsername;
    int totalCollections;
    int totalLikes;
    int totalPhotos;
    bool acceptedTos;
    bool forHire;
    Social social;

    User({
        required this.id,
        required this.updatedAt,
        required this.username,
        required this.name,
        required this.firstName,
        this.lastName,
        this.twitterUsername,
        this.portfolioUrl,
        this.bio,
        this.location,
        required this.links,
        required this.profileImage,
        this.instagramUsername,
        required this.totalCollections,
        required this.totalLikes,
        required this.totalPhotos,
        required this.acceptedTos,
        required this.forHire,
        required this.social,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        updatedAt: DateTime.parse(json["updated_at"]),
        username: json["username"],
        name: json["name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        twitterUsername: json["twitter_username"],
        portfolioUrl: json["portfolio_url"],
        bio: json["bio"],
        location: json["location"],
        links: UserLinks.fromJson(json["links"]),
        profileImage: ProfileImage.fromJson(json["profile_image"]),
        instagramUsername: json["instagram_username"],
        totalCollections: json["total_collections"],
        totalLikes: json["total_likes"],
        totalPhotos: json["total_photos"],
        acceptedTos: json["accepted_tos"],
        forHire: json["for_hire"],
        social: Social.fromJson(json["social"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "updated_at": updatedAt.toIso8601String(),
        "username": username,
        "name": name,
        "first_name": firstName,
        "last_name": lastName,
        "twitter_username": twitterUsername,
        "portfolio_url": portfolioUrl,
        "bio": bio,
        "location": location,
        "links": links.toJson(),
        "profile_image": profileImage.toJson(),
        "instagram_username": instagramUsername,
        "total_collections": totalCollections,
        "total_likes": totalLikes,
        "total_photos": totalPhotos,
        "accepted_tos": acceptedTos,
        "for_hire": forHire,
        "social": social.toJson(),
    };
}

class UserLinks {
    String self;
    String html;
    String photos;
    String likes;
    String portfolio;
    String following;
    String followers;

    UserLinks({
        required this.self,
        required this.html,
        required this.photos,
        required this.likes,
        required this.portfolio,
        required this.following,
        required this.followers,
    });

    factory UserLinks.fromJson(Map<String, dynamic> json) => UserLinks(
        self: json["self"],
        html: json["html"],
        photos: json["photos"],
        likes: json["likes"],
        portfolio: json["portfolio"],
        following: json["following"],
        followers: json["followers"],
    );

    Map<String, dynamic> toJson() => {
        "self": self,
        "html": html,
        "photos": photos,
        "likes": likes,
        "portfolio": portfolio,
        "following": following,
        "followers": followers,
    };
}

class ProfileImage {
    String small;
    String medium;
    String large;

    ProfileImage({
        required this.small,
        required this.medium,
        required this.large,
    });

    factory ProfileImage.fromJson(Map<String, dynamic> json) => ProfileImage(
        small: json["small"],
        medium: json["medium"],
        large: json["large"],
    );

    Map<String, dynamic> toJson() => {
        "small": small,
        "medium": medium,
        "large": large,
    };
}

class Social {
    String? instagramUsername;
    String? portfolioUrl;
    String? twitterUsername;
    dynamic paypalEmail;

    Social({
        this.instagramUsername,
        this.portfolioUrl,
        this.twitterUsername,
        this.paypalEmail,
    });

    factory Social.fromJson(Map<String, dynamic> json) => Social(
        instagramUsername: json["instagram_username"],
        portfolioUrl: json["portfolio_url"],
        twitterUsername: json["twitter_username"],
        paypalEmail: json["paypal_email"],
    );

    Map<String, dynamic> toJson() => {
        "instagram_username": instagramUsername,
        "portfolio_url": portfolioUrl,
        "twitter_username": twitterUsername,
        "paypal_email": paypalEmail,
    };
}

class UnsplashCollectionLinks {
    String self;
    String html;
    String photos;
    String related;

    UnsplashCollectionLinks({
        required this.self,
        required this.html,
        required this.photos,
        required this.related,
    });

    factory UnsplashCollectionLinks.fromJson(Map<String, dynamic> json) => UnsplashCollectionLinks(
        self: json["self"],
        html: json["html"],
        photos: json["photos"],
        related: json["related"],
    );

    Map<String, dynamic> toJson() => {
        "self": self,
        "html": html,
        "photos": photos,
        "related": related,
    };
}

class PreviewPhoto {
    String id;
    String slug;
    DateTime createdAt;
    DateTime updatedAt;
    String blurHash;
    Urls urls;

    PreviewPhoto({
        required this.id,
        required this.slug,
        required this.createdAt,
        required this.updatedAt,
        required this.blurHash,
        required this.urls,
    });

    factory PreviewPhoto.fromJson(Map<String, dynamic> json) => PreviewPhoto(
        id: json["id"],
        slug: json["slug"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        blurHash: json["blur_hash"],
        urls: Urls.fromJson(json["urls"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "blur_hash": blurHash,
        "urls": urls.toJson(),
    };
}

class Tag {
    TypeEnum type;
    String title;
    Source? source;

    Tag({
        required this.type,
        required this.title,
        this.source,
    });

    factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        type: typeEnumValues.map[json["type"]]!,
        title: json["title"],
        source: json["source"] == null ? null : Source.fromJson(json["source"]),
    );

    Map<String, dynamic> toJson() => {
        "type": typeEnumValues.reverse[type],
        "title": title,
        "source": source?.toJson(),
    };
}

class Source {
    Ancestry ancestry;
    String title;
    String subtitle;
    String description;
    String metaTitle;
    String metaDescription;
    SourceCoverPhoto coverPhoto;

    Source({
        required this.ancestry,
        required this.title,
        required this.subtitle,
        required this.description,
        required this.metaTitle,
        required this.metaDescription,
        required this.coverPhoto,
    });

    factory Source.fromJson(Map<String, dynamic> json) => Source(
        ancestry: Ancestry.fromJson(json["ancestry"]),
        title: json["title"],
        subtitle: json["subtitle"],
        description: json["description"],
        metaTitle: json["meta_title"],
        metaDescription: json["meta_description"],
        coverPhoto: SourceCoverPhoto.fromJson(json["cover_photo"]),
    );

    Map<String, dynamic> toJson() => {
        "ancestry": ancestry.toJson(),
        "title": title,
        "subtitle": subtitle,
        "description": description,
        "meta_title": metaTitle,
        "meta_description": metaDescription,
        "cover_photo": coverPhoto.toJson(),
    };
}

class Ancestry {
    TypeClass type;
    TypeClass? category;
    TypeClass? subcategory;

    Ancestry({
        required this.type,
        this.category,
        this.subcategory,
    });

    factory Ancestry.fromJson(Map<String, dynamic> json) => Ancestry(
        type: TypeClass.fromJson(json["type"]),
        category: json["category"] == null ? null : TypeClass.fromJson(json["category"]),
        subcategory: json["subcategory"] == null ? null : TypeClass.fromJson(json["subcategory"]),
    );

    Map<String, dynamic> toJson() => {
        "type": type.toJson(),
        "category": category?.toJson(),
        "subcategory": subcategory?.toJson(),
    };
}

class TypeClass {
    String slug;
    String prettySlug;

    TypeClass({
        required this.slug,
        required this.prettySlug,
    });

    factory TypeClass.fromJson(Map<String, dynamic> json) => TypeClass(
        slug: json["slug"],
        prettySlug: json["pretty_slug"],
    );

    Map<String, dynamic> toJson() => {
        "slug": slug,
        "pretty_slug": prettySlug,
    };
}

class SourceCoverPhoto {
    String id;
    String slug;
    DateTime createdAt;
    DateTime updatedAt;
    DateTime? promotedAt;
    int width;
    int height;
    String color;
    String blurHash;
    String? description;
    String altDescription;
    Urls urls;
    CoverPhotoLinks links;
    int likes;
    bool likedByUser;
    List<dynamic> currentUserCollections;
    dynamic sponsorship;
    Map<String, ArchitectureInterior> topicSubmissions;
    bool? premium;
    bool? plus;
    User user;

    SourceCoverPhoto({
        required this.id,
        required this.slug,
        required this.createdAt,
        required this.updatedAt,
        this.promotedAt,
        required this.width,
        required this.height,
        required this.color,
        required this.blurHash,
        this.description,
        required this.altDescription,
        required this.urls,
        required this.links,
        required this.likes,
        required this.likedByUser,
        required this.currentUserCollections,
        this.sponsorship,
        required this.topicSubmissions,
        this.premium,
        this.plus,
        required this.user,
    });

    factory SourceCoverPhoto.fromJson(Map<String, dynamic> json) => SourceCoverPhoto(
        id: json["id"],
        slug: json["slug"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        promotedAt: json["promoted_at"] == null ? null : DateTime.parse(json["promoted_at"]),
        width: json["width"],
        height: json["height"],
        color: json["color"],
        blurHash: json["blur_hash"],
        description: json["description"],
        altDescription: json["alt_description"],
        urls: Urls.fromJson(json["urls"]),
        links: CoverPhotoLinks.fromJson(json["links"]),
        likes: json["likes"],
        likedByUser: json["liked_by_user"],
        currentUserCollections: List<dynamic>.from(json["current_user_collections"].map((x) => x)),
        sponsorship: json["sponsorship"],
        topicSubmissions: Map.from(json["topic_submissions"]).map((k, v) => MapEntry<String, ArchitectureInterior>(k, ArchitectureInterior.fromJson(v))),
        premium: json["premium"],
        plus: json["plus"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "promoted_at": promotedAt?.toIso8601String(),
        "width": width,
        "height": height,
        "color": color,
        "blur_hash": blurHash,
        "description": description,
        "alt_description": altDescription,
        "urls": urls.toJson(),
        "links": links.toJson(),
        "likes": likes,
        "liked_by_user": likedByUser,
        "current_user_collections": List<dynamic>.from(currentUserCollections.map((x) => x)),
        "sponsorship": sponsorship,
        "topic_submissions": Map.from(topicSubmissions).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "premium": premium,
        "plus": plus,
        "user": user.toJson(),
    };
}

enum TypeEnum { LANDING_PAGE, SEARCH }

final typeEnumValues = EnumValues({
    "landing_page": TypeEnum.LANDING_PAGE,
    "search": TypeEnum.SEARCH
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
