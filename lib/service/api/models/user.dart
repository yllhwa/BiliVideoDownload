class User {
  int? code;
  String? message;
  int? ttl;
  Data? data;

  User({this.code, this.message, this.ttl, this.data});

  User.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    ttl = json['ttl'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    data['ttl'] = this.ttl;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  bool? isLogin;
  int? emailVerified;
  String? face;
  int? faceNft;
  int? faceNftType;
  LevelInfo? levelInfo;
  int? mid;
  int? mobileVerified;
  double? money;
  int? moral;
  Official? official;
  OfficialVerify? officialVerify;
  Pendant? pendant;
  int? scores;
  String? uname;
  int? vipDueDate;
  int? vipStatus;
  int? vipType;
  int? vipPayType;
  int? vipThemeType;
  VipLabel? vipLabel;
  int? vipAvatarSubscript;
  String? vipNicknameColor;
  Vip? vip;
  Wallet? wallet;
  bool? hasShop;
  String? shopUrl;
  int? allowanceCount;
  int? answerStatus;
  int? isSeniorMember;
  WbiImg? wbiImg;
  bool? isJury;

  Data(
      {this.isLogin,
      this.emailVerified,
      this.face,
      this.faceNft,
      this.faceNftType,
      this.levelInfo,
      this.mid,
      this.mobileVerified,
      this.money,
      this.moral,
      this.official,
      this.officialVerify,
      this.pendant,
      this.scores,
      this.uname,
      this.vipDueDate,
      this.vipStatus,
      this.vipType,
      this.vipPayType,
      this.vipThemeType,
      this.vipLabel,
      this.vipAvatarSubscript,
      this.vipNicknameColor,
      this.vip,
      this.wallet,
      this.hasShop,
      this.shopUrl,
      this.allowanceCount,
      this.answerStatus,
      this.isSeniorMember,
      this.wbiImg,
      this.isJury});

  Data.fromJson(Map<String, dynamic> json) {
    isLogin = json['isLogin'];
    emailVerified = json['email_verified'];
    face = json['face'];
    faceNft = json['face_nft'];
    faceNftType = json['face_nft_type'];
    levelInfo = json['level_info'] != null
        ? new LevelInfo.fromJson(json['level_info'])
        : null;
    mid = json['mid'];
    mobileVerified = json['mobile_verified'];
    money = json['money'];
    moral = json['moral'];
    official = json['official'] != null
        ? new Official.fromJson(json['official'])
        : null;
    officialVerify = json['officialVerify'] != null
        ? new OfficialVerify.fromJson(json['officialVerify'])
        : null;
    pendant =
        json['pendant'] != null ? new Pendant.fromJson(json['pendant']) : null;
    scores = json['scores'];
    uname = json['uname'];
    vipDueDate = json['vipDueDate'];
    vipStatus = json['vipStatus'];
    vipType = json['vipType'];
    vipPayType = json['vip_pay_type'];
    vipThemeType = json['vip_theme_type'];
    vipLabel = json['vip_label'] != null
        ? new VipLabel.fromJson(json['vip_label'])
        : null;
    vipAvatarSubscript = json['vip_avatar_subscript'];
    vipNicknameColor = json['vip_nickname_color'];
    vip = json['vip'] != null ? new Vip.fromJson(json['vip']) : null;
    wallet =
        json['wallet'] != null ? new Wallet.fromJson(json['wallet']) : null;
    hasShop = json['has_shop'];
    shopUrl = json['shop_url'];
    allowanceCount = json['allowance_count'];
    answerStatus = json['answer_status'];
    isSeniorMember = json['is_senior_member'];
    wbiImg =
        json['wbi_img'] != null ? new WbiImg.fromJson(json['wbi_img']) : null;
    isJury = json['is_jury'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isLogin'] = this.isLogin;
    data['email_verified'] = this.emailVerified;
    data['face'] = this.face;
    data['face_nft'] = this.faceNft;
    data['face_nft_type'] = this.faceNftType;
    if (this.levelInfo != null) {
      data['level_info'] = this.levelInfo!.toJson();
    }
    data['mid'] = this.mid;
    data['mobile_verified'] = this.mobileVerified;
    data['money'] = this.money;
    data['moral'] = this.moral;
    if (this.official != null) {
      data['official'] = this.official!.toJson();
    }
    if (this.officialVerify != null) {
      data['officialVerify'] = this.officialVerify!.toJson();
    }
    if (this.pendant != null) {
      data['pendant'] = this.pendant!.toJson();
    }
    data['scores'] = this.scores;
    data['uname'] = this.uname;
    data['vipDueDate'] = this.vipDueDate;
    data['vipStatus'] = this.vipStatus;
    data['vipType'] = this.vipType;
    data['vip_pay_type'] = this.vipPayType;
    data['vip_theme_type'] = this.vipThemeType;
    if (this.vipLabel != null) {
      data['vip_label'] = this.vipLabel!.toJson();
    }
    data['vip_avatar_subscript'] = this.vipAvatarSubscript;
    data['vip_nickname_color'] = this.vipNicknameColor;
    if (this.vip != null) {
      data['vip'] = this.vip!.toJson();
    }
    if (this.wallet != null) {
      data['wallet'] = this.wallet!.toJson();
    }
    data['has_shop'] = this.hasShop;
    data['shop_url'] = this.shopUrl;
    data['allowance_count'] = this.allowanceCount;
    data['answer_status'] = this.answerStatus;
    data['is_senior_member'] = this.isSeniorMember;
    if (this.wbiImg != null) {
      data['wbi_img'] = this.wbiImg!.toJson();
    }
    data['is_jury'] = this.isJury;
    return data;
  }
}

class LevelInfo {
  int? currentLevel;
  int? currentMin;
  int? currentExp;
  int? nextExp;

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
    data['current_level'] = this.currentLevel;
    data['current_min'] = this.currentMin;
    data['current_exp'] = this.currentExp;
    data['next_exp'] = this.nextExp;
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
    data['role'] = this.role;
    data['title'] = this.title;
    data['desc'] = this.desc;
    data['type'] = this.type;
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
    data['type'] = this.type;
    data['desc'] = this.desc;
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
    data['pid'] = this.pid;
    data['name'] = this.name;
    data['image'] = this.image;
    data['expire'] = this.expire;
    data['image_enhance'] = this.imageEnhance;
    data['image_enhance_frame'] = this.imageEnhanceFrame;
    return data;
  }
}

class VipLabel {
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

  VipLabel(
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

  VipLabel.fromJson(Map<String, dynamic> json) {
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
    data['path'] = this.path;
    data['text'] = this.text;
    data['label_theme'] = this.labelTheme;
    data['text_color'] = this.textColor;
    data['bg_style'] = this.bgStyle;
    data['bg_color'] = this.bgColor;
    data['border_color'] = this.borderColor;
    data['use_img_label'] = this.useImgLabel;
    data['img_label_uri_hans'] = this.imgLabelUriHans;
    data['img_label_uri_hant'] = this.imgLabelUriHant;
    data['img_label_uri_hans_static'] = this.imgLabelUriHansStatic;
    data['img_label_uri_hant_static'] = this.imgLabelUriHantStatic;
    return data;
  }
}

class Vip {
  int? type;
  int? status;
  int? dueDate;
  int? vipPayType;
  int? themeType;
  VipLabel? label;
  int? avatarSubscript;
  String? nicknameColor;
  int? role;
  String? avatarSubscriptUrl;
  int? tvVipStatus;
  int? tvVipPayType;
  int? tvDueDate;

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
      this.tvDueDate});

  Vip.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    status = json['status'];
    dueDate = json['due_date'];
    vipPayType = json['vip_pay_type'];
    themeType = json['theme_type'];
    label = json['label'] != null ? new VipLabel.fromJson(json['label']) : null;
    avatarSubscript = json['avatar_subscript'];
    nicknameColor = json['nickname_color'];
    role = json['role'];
    avatarSubscriptUrl = json['avatar_subscript_url'];
    tvVipStatus = json['tv_vip_status'];
    tvVipPayType = json['tv_vip_pay_type'];
    tvDueDate = json['tv_due_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['status'] = this.status;
    data['due_date'] = this.dueDate;
    data['vip_pay_type'] = this.vipPayType;
    data['theme_type'] = this.themeType;
    if (this.label != null) {
      data['label'] = this.label!.toJson();
    }
    data['avatar_subscript'] = this.avatarSubscript;
    data['nickname_color'] = this.nicknameColor;
    data['role'] = this.role;
    data['avatar_subscript_url'] = this.avatarSubscriptUrl;
    data['tv_vip_status'] = this.tvVipStatus;
    data['tv_vip_pay_type'] = this.tvVipPayType;
    data['tv_due_date'] = this.tvDueDate;
    return data;
  }
}

class Wallet {
  int? mid;
  int? bcoinBalance;
  int? couponBalance;
  int? couponDueTime;

  Wallet({this.mid, this.bcoinBalance, this.couponBalance, this.couponDueTime});

  Wallet.fromJson(Map<String, dynamic> json) {
    mid = json['mid'];
    bcoinBalance = json['bcoin_balance'];
    couponBalance = json['coupon_balance'];
    couponDueTime = json['coupon_due_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mid'] = this.mid;
    data['bcoin_balance'] = this.bcoinBalance;
    data['coupon_balance'] = this.couponBalance;
    data['coupon_due_time'] = this.couponDueTime;
    return data;
  }
}

class WbiImg {
  String? imgUrl;
  String? subUrl;

  WbiImg({this.imgUrl, this.subUrl});

  WbiImg.fromJson(Map<String, dynamic> json) {
    imgUrl = json['img_url'];
    subUrl = json['sub_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['img_url'] = this.imgUrl;
    data['sub_url'] = this.subUrl;
    return data;
  }
}
