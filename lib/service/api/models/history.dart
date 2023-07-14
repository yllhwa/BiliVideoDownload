class History {
  int? code;
  String? message;
  int? ttl;
  Data? data;

  History({
    this.code,
    this.message,
    this.ttl,
    this.data,
  });

  factory History.fromJson(Map<String, dynamic> json) => History(
        code: json["code"],
        message: json["message"],
        ttl: json["ttl"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "ttl": ttl,
        "data": data?.toJson(),
      };
}

class Data {
  Cursor? cursor;
  List<Tab>? tab;
  List<ListElement>? list;

  Data({
    this.cursor,
    this.tab,
    this.list,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        cursor: json["cursor"] == null ? null : Cursor.fromJson(json["cursor"]),
        tab: json["tab"] == null
            ? []
            : List<Tab>.from(json["tab"]!.map((x) => Tab.fromJson(x))),
        list: json["list"] == null
            ? []
            : List<ListElement>.from(
                json["list"]!.map((x) => ListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "cursor": cursor?.toJson(),
        "tab":
            tab == null ? [] : List<dynamic>.from(tab!.map((x) => x.toJson())),
        "list": list == null
            ? []
            : List<dynamic>.from(list!.map((x) => x.toJson())),
      };
}

class Cursor {
  int? max;
  int? viewAt;
  String? business;
  int? ps;

  Cursor({
    this.max,
    this.viewAt,
    this.business,
    this.ps,
  });

  factory Cursor.fromJson(Map<String, dynamic> json) => Cursor(
        max: json["max"],
        viewAt: json["view_at"],
        business: json["business"]!,
        ps: json["ps"],
      );

  Map<String, dynamic> toJson() => {
        "max": max,
        "view_at": viewAt,
        "business": business,
        "ps": ps,
      };
}

class ListElement {
  String? title;
  String? longTitle;
  String? cover;
  dynamic covers;
  String? uri;
  HistoryClass? history;
  int? videos;
  String? authorName;
  String? authorFace;
  int? authorMid;
  int? viewAt;
  int? progress;
  String? badge;
  String? showTitle;
  int? duration;
  String? current;
  int? total;
  String? newDesc;
  int? isFinish;
  int? isFav;
  int? kid;
  String? tagName;
  int? liveStatus;

  ListElement({
    this.title,
    this.longTitle,
    this.cover,
    this.covers,
    this.uri,
    this.history,
    this.videos,
    this.authorName,
    this.authorFace,
    this.authorMid,
    this.viewAt,
    this.progress,
    this.badge,
    this.showTitle,
    this.duration,
    this.current,
    this.total,
    this.newDesc,
    this.isFinish,
    this.isFav,
    this.kid,
    this.tagName,
    this.liveStatus,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        title: json["title"],
        longTitle: json["long_title"],
        cover: json["cover"],
        covers: json["covers"],
        uri: json["uri"],
        history: json["history"] == null
            ? null
            : HistoryClass.fromJson(json["history"]),
        videos: json["videos"],
        authorName: json["author_name"],
        authorFace: json["author_face"],
        authorMid: json["author_mid"],
        viewAt: json["view_at"],
        progress: json["progress"],
        badge: json["badge"],
        showTitle: json["show_title"],
        duration: json["duration"],
        current: json["current"],
        total: json["total"],
        newDesc: json["new_desc"],
        isFinish: json["is_finish"],
        isFav: json["is_fav"],
        kid: json["kid"],
        tagName: json["tag_name"],
        liveStatus: json["live_status"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "long_title": longTitle,
        "cover": cover,
        "covers": covers,
        "uri": uri,
        "history": history?.toJson(),
        "videos": videos,
        "author_name": authorName,
        "author_face": authorFace,
        "author_mid": authorMid,
        "view_at": viewAt,
        "progress": progress,
        "badge": badge,
        "show_title": showTitle,
        "duration": duration,
        "current": current,
        "total": total,
        "new_desc": newDesc,
        "is_finish": isFinish,
        "is_fav": isFav,
        "kid": kid,
        "tag_name": tagName,
        "live_status": liveStatus,
      };
}

class HistoryClass {
  int? oid;
  int? epid;
  String? bvid;
  int? page;
  int? cid;
  String? historyPart;
  String? business;
  int? dt;

  HistoryClass({
    this.oid,
    this.epid,
    this.bvid,
    this.page,
    this.cid,
    this.historyPart,
    this.business,
    this.dt,
  });

  factory HistoryClass.fromJson(Map<String, dynamic> json) => HistoryClass(
        oid: json["oid"],
        epid: json["epid"],
        bvid: json["bvid"],
        page: json["page"],
        cid: json["cid"],
        historyPart: json["part"],
        business: json["business"],
        dt: json["dt"],
      );

  Map<String, dynamic> toJson() => {
        "oid": oid,
        "epid": epid,
        "bvid": bvid,
        "page": page,
        "cid": cid,
        "part": historyPart,
        "business": business,
        "dt": dt,
      };
}

class Tab {
  String? type;
  String? name;

  Tab({
    this.type,
    this.name,
  });

  factory Tab.fromJson(Map<String, dynamic> json) => Tab(
        type: json["type"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "name": name,
      };
}
