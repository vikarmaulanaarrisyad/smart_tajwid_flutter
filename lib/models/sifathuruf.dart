// To parse this JSON data, do
//
//     final sifatHuruf = sifatHurufFromJson(jsonString);

import 'dart:convert';

SifatHuruf sifatHurufFromJson(String str) {
  final jsonData = json.decode(str);
  return SifatHuruf.fromJson(jsonData);
}

String sifatHurufToJson(SifatHuruf data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class SifatHuruf {
  List<SifatHurufElement> sifatHuruf;

  SifatHuruf({
    required this.sifatHuruf,
  });

  factory SifatHuruf.fromJson(Map<String, dynamic> json) => new SifatHuruf(
        sifatHuruf: new List<SifatHurufElement>.from(
            json["sifat_huruf"].map((x) => SifatHurufElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "sifat_huruf":
            new List<dynamic>.from(sifatHuruf.map((x) => x.toJson())),
      };
}

class SifatHurufElement {
  String arabic;
  String indonesian;

  SifatHurufElement({
    required this.arabic,
    required this.indonesian,
  });

  factory SifatHurufElement.fromJson(Map<String, dynamic> json) =>
      new SifatHurufElement(
        arabic: json["arabic"],
        indonesian: json["indonesian"],
      );

  Map<String, dynamic> toJson() => {
        "arabic": arabic,
        "indonesian": indonesian,
      };
}
