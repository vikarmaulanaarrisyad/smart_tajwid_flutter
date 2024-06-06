// To parse this JSON data, do
//
//     final makhroj = makhrojFromJson(jsonString);

import 'dart:convert';

Makhroj makhrojFromJson(String str) {
  final jsonData = json.decode(str);
  return Makhroj.fromJson(jsonData);
}

String makhrojToJson(Makhroj data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class Makhroj {
  List<MakhrojHuruf> makhrojHuruf;

  Makhroj({
    required this.makhrojHuruf,
  });

  factory Makhroj.fromJson(Map<String, dynamic> json) => new Makhroj(
        makhrojHuruf: new List<MakhrojHuruf>.from(
            json["makhroj_huruf"].map((x) => MakhrojHuruf.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "makhroj_huruf":
            new List<dynamic>.from(makhrojHuruf.map((x) => x.toJson())),
      };
}

class MakhrojHuruf {
  String ayat;
  String arti;

  MakhrojHuruf({
    required this.ayat,
    required this.arti,
  });

  factory MakhrojHuruf.fromJson(Map<String, dynamic> json) => new MakhrojHuruf(
        ayat: json["ayat"],
        arti: json["arti"],
      );

  Map<String, dynamic> toJson() => {
        "ayat": ayat,
        "arti": arti,
      };
}
