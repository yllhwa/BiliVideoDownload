class UserInfoPublic {
  int? code;
  String? message;
  int? ttl;
  Data? data;

  UserInfoPublic({this.code, this.message, this.ttl, this.data});

  UserInfoPublic.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    ttl = json['ttl'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = code;
    data['message'] = message;
    data['ttl'] = ttl;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Card? card;
  bool? following;
  int? archiveCount;
  int? articleCount;
  int? follower;
  int? likeNum;

  Data(
      {this.card,
      this.following,
      this.archiveCount,
      this.articleCount,
      this.follower,
      this.likeNum});

  Data.fromJson(Map<String, dynamic> json) {
    card = json['card'] != null ? new Card.fromJson(json['card']) : null;
    following = json['following'];
    archiveCount = json['archive_count'];
    articleCount = json['article_count'];
    follower = json['follower'];
    likeNum = json['like_num'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (card != null) {
      data['card'] = card!.toJson();
    }
    data['following'] = following;
    data['archive_count'] = archiveCount;
    data['article_count'] = articleCount;
    data['follower'] = follower;
    data['like_num'] = likeNum;
    return data;
  }
}

class Card {
  String? mid;
  String? name;
  bool? approve;
  String? sex;
  String? rank;
  String? face;
  int? faceNft;
  int? faceNftType;
  String? displayRank;
  int? regtime;
  int? spacesta;
  String? birthday;
  String? place;
  String? description;
  int? article;
  List<Null>? attentions;
  int? fans;
  int? friend;
  int? attention;
  String? sign;
  LevelInfo? levelInfo;
  Pendant? pendant;
  Nameplate? nameplate;
  Official? official;
  OfficialVerify? officialVerify;
  Vip? vip;
  int? isSeniorMember;

  Card(
      {this.mid,
      this.name,
      this.approve,
      this.sex,
      this.rank,
      this.face,
      this.faceNft,
      this.faceNftType,
      this.displayRank,
      this.regtime,
      this.spacesta,
      this.birthday,
      this.place,
      this.description,
      this.article,
      this.attentions,
      this.fans,
      this.friend,
      this.attention,
      this.sign,
      this.levelInfo,
      this.pendant,
      this.nameplate,
      this.official,
      this.officialVerify,
      this.vip,
      this.isSeniorMember});

  Card.fromJson(Map<String, dynamic> json) {
    mid = json['mid'];
    name = json['name'];
    approve = json['approve'];
    sex = json['sex'];
    rank = json['rank'];
    face = json['face'];
    faceNft = json['face_nft'];
    faceNftType = json['face_nft_type'];
    displayRank = json['DisplayRank'];
    regtime = json['regtime'];
    spacesta = json['spacesta'];
    birthday = json['birthday'];
    place = json['place'];
    description = json['description'];
    article = json['article'];
    fans = json['fans'];
    friend = json['friend'];
    attention = json['attention'];
    sign = json['sign'];
    levelInfo = json['level_info'] != null
        ? new LevelInfo.fromJson(json['level_info'])
        : null;
    pendant =
        json['pendant'] != null ? new Pendant.fromJson(json['pendant']) : null;
    nameplate = json['nameplate'] != null
        ? new Nameplate.fromJson(json['nameplate'])
        : null;
    official = json['Official'] != null
        ? new Official.fromJson(json['Official'])
        : null;
    officialVerify = json['official_verify'] != null
        ? new OfficialVerify.fromJson(json['official_verify'])
        : null;
    vip = json['vip'] != null ? new Vip.fromJson(json['vip']) : null;
    isSeniorMember = json['is_senior_member'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mid'] = mid;
    data['name'] = name;
    data['approve'] = approve;
    data['sex'] = sex;
    data['rank'] = rank;
    data['face'] = face;
    data['face_nft'] = faceNft;
    data['face_nft_type'] = faceNftType;
    data['DisplayRank'] = displayRank;
    data['regtime'] = regtime;
    data['spacesta'] = spacesta;
    data['birthday'] = birthday;
    data['place'] = place;
    data['description'] = description;
    data['article'] = article;
    data['fans'] = fans;
    data['friend'] = friend;
    data['attention'] = attention;
    data['sign'] = sign;
    if (levelInfo != null) {
      data['level_info'] = levelInfo!.toJson();
    }
    if (pendant != null) {
      data['pendant'] = pendant!.toJson();
    }
    if (nameplate != null) {
      data['nameplate'] = nameplate!.toJson();
    }
    if (official != null) {
      data['Official'] = official!.toJson();
    }
    if (officialVerify != null) {
      data['official_verify'] = officialVerify!.toJson();
    }
    if (vip != null) {
      data['vip'] = vip!.toJson();
    }
    data['is_senior_member'] = isSeniorMember;
    return data;
  }
}

class LevelInfo {
  int? currentLevel;
  int? currentMin;
  int? currentExp;
  String? nextExp;

  LevelInfo(
      {this.currentLevel, this.currentMin, this.currentExp, this.nextExp});

  LevelInfo.fromJson(Map<String, dynamic> json) {
    currentLevel = json['current_level'];
    currentMin = json['current_min'];
    currentExp = json['current_exp'];
    // nextExp = json['next_exp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_level'] = currentLevel;
    data['current_min'] = currentMin;
    data['current_exp'] = currentExp;
    // data['next_exp'] = nextExp;
    return data;
  }
}

class Pendant {
  int? pid;
  String? name;
  String? image;
  int? expire;
  String? imageEnhance;
  String? imageEnhanceFrame;

  Pendant(
      {this.pid,
      this.name,
      this.image,
      this.expire,
      this.imageEnhance,
      this.imageEnhanceFrame});

  Pendant.fromJson(Map<String, dynamic> json) {
    pid = json['pid'];
    name = json['name'];
    image = json['image'];
    expire = json['expire'];
    imageEnhance = json['image_enhance'];
    imageEnhanceFrame = json['image_enhance_frame'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pid'] = pid;
    data['name'] = name;
    data['image'] = image;
    data['expire'] = expire;
    data['image_enhance'] = imageEnhance;
    data['image_enhance_frame'] = imageEnhanceFrame;
    return data;
  }
}

class Nameplate {
  int? nid;
  String? name;
  String? image;
  String? imageSmall;
  String? level;
  String? condition;

  Nameplate(
      {this.nid,
      this.name,
      this.image,
      this.imageSmall,
      this.level,
      this.condition});

  Nameplate.fromJson(Map<String, dynamic> json) {
    nid = json['nid'];
    name = json['name'];
    image = json['image'];
    imageSmall = json['image_small'];
    level = json['level'];
    condition = json['condition'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nid'] = nid;
    data['name'] = name;
    data['image'] = image;
    data['image_small'] = imageSmall;
    data['level'] = level;
    data['condition'] = condition;
    return data;
  }
}

class Official {
  int? role;
  String? title;
  String? desc;
  int? type;

  Official({this.role, this.title, this.desc, this.type});

  Official.fromJson(Map<String, dynamic> json) {
    role = json['role'];
    title = json['title'];
    desc = json['desc'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['role'] = role;
    data['title'] = title;
    data['desc'] = desc;
    data['type'] = type;
    return data;
  }
}

class OfficialVerify {
  int? type;
  String? desc;

  OfficialVerify({this.type, this.desc});

  OfficialVerify.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = type;
    data['desc'] = desc;
    return data;
  }
}

class Vip {
  int? type;
  int? status;
  int? dueDate;
  int? vipPayType;
  int? themeType;
  Label? label;
  int? avatarSubscript;
  String? nicknameColor;
  int? role;
  String? avatarSubscriptUrl;
  int? tvVipStatus;
  int? tvVipPayType;
  int? tvDueDate;
  int? vipType;
  int? vipStatus;

  Vip(
      {this.type,
      this.status,
      this.dueDate,
      this.vipPayType,
      this.themeType,
      this.label,
      this.avatarSubscript,
      this.nicknameColor,
      this.role,
      this.avatarSubscriptUrl,
      this.tvVipStatus,
      this.tvVipPayType,
      this.tvDueDate,
      this.vipType,
      this.vipStatus});

  Vip.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    status = json['status'];
    dueDate = json['due_date'];
    vipPayType = json['vip_pay_type'];
    themeType = json['theme_type'];
    label = json['label'] != null ? new Label.fromJson(json['label']) : null;
    avatarSubscript = json['avatar_subscript'];
    nicknameColor = json['nickname_color'];
    role = json['role'];
    avatarSubscriptUrl = json['avatar_subscript_url'];
    tvVipStatus = json['tv_vip_status'];
    tvVipPayType = json['tv_vip_pay_type'];
    tvDueDate = json['tv_due_date'];
    vipType = json['vipType'];
    vipStatus = json['vipStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = type;
    data['status'] = status;
    data['due_date'] = dueDate;
    data['vip_pay_type'] = vipPayType;
    data['theme_type'] = themeType;
    if (label != null) {
      data['label'] = label!.toJson();
    }
    data['avatar_subscript'] = avatarSubscript;
    data['nickname_color'] = nicknameColor;
    data['role'] = role;
    data['avatar_subscript_url'] = avatarSubscriptUrl;
    data['tv_vip_status'] = tvVipStatus;
    data['tv_vip_pay_type'] = tvVipPayType;
    data['tv_due_date'] = tvDueDate;
    data['vipType'] = vipType;
    data['vipStatus'] = vipStatus;
    return data;
  }
}

class Label {
  String? path;
  String? text;
  String? labelTheme;
  String? textColor;
  int? bgStyle;
  String? bgColor;
  String? borderColor;
  bool? useImgLabel;
  String? imgLabelUriHans;
  String? imgLabelUriHant;
  String? imgLabelUriHansStatic;
  String? imgLabelUriHantStatic;

  Label(
      {this.path,
      this.text,
      this.labelTheme,
      this.textColor,
      this.bgStyle,
      this.bgColor,
      this.borderColor,
      this.useImgLabel,
      this.imgLabelUriHans,
      this.imgLabelUriHant,
      this.imgLabelUriHansStatic,
      this.imgLabelUriHantStatic});

  Label.fromJson(Map<String, dynamic> json) {
    path = json['path'];
    text = json['text'];
    labelTheme = json['label_theme'];
    textColor = json['text_color'];
    bgStyle = json['bg_style'];
    bgColor = json['bg_color'];
    borderColor = json['border_color'];
    useImgLabel = json['use_img_label'];
    imgLabelUriHans = json['img_label_uri_hans'];
    imgLabelUriHant = json['img_label_uri_hant'];
    imgLabelUriHansStatic = json['img_label_uri_hans_static'];
    imgLabelUriHantStatic = json['img_label_uri_hant_static'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['path'] = path;
    data['text'] = text;
    data['label_theme'] = labelTheme;
    data['text_color'] = textColor;
    data['bg_style'] = bgStyle;
    data['bg_color'] = bgColor;
    data['border_color'] = borderColor;
    data['use_img_label'] = useImgLabel;
    data['img_label_uri_hans'] = imgLabelUriHans;
    data['img_label_uri_hant'] = imgLabelUriHant;
    data['img_label_uri_hans_static'] = imgLabelUriHansStatic;
    data['img_label_uri_hant_static'] = imgLabelUriHantStatic;
    return data;
  }
}
