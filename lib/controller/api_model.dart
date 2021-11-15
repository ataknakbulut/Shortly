import 'dart:convert';

ApiModel apiModelFromJson(String str) => ApiModel.fromJson(json.decode(str));

class ApiModel {
  ApiModel({
    required this.ok,
    this.errorCode,
    this.error,
    this.result,
  });

  bool ok;
  int? errorCode;
  String? error;
  Result? result;

  factory ApiModel.fromJson(Map<String, dynamic> json) => ApiModel(
        ok: json["ok"],
        errorCode: json["error_code"],
        error: json["error"],
        result: Result.fromJson(json["result"]),
      );
}

class Result {
  Result({
    required this.code,
    this.shortLink,
    this.fullShortLink,
    this.shortLink2,
    this.fullShortLink2,
    this.shortLink3,
    this.fullShortLink3,
    this.shareLink,
    this.fullShareLink,
    this.originalLink,
  });

  String code;
  String? shortLink;
  String? fullShortLink;
  String? shortLink2;
  String? fullShortLink2;
  String? shortLink3;
  String? fullShortLink3;
  String? shareLink;
  String? fullShareLink;
  String? originalLink;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        code: json["code"],
        shortLink: json["short_link"],
        fullShortLink: json["full_short_link"],
        shortLink2: json["short_link2"],
        fullShortLink2: json["full_short_link2"],
        shortLink3: json["short_link3"],
        fullShortLink3: json["full_short_link3"],
        shareLink: json["share_link"],
        fullShareLink: json["full_share_link"],
        originalLink: json["original_link"],
      );
}
