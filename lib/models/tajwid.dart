// To parse this JSON data, do
//
//     final tajwid = tajwidFromJson(jsonString);

import 'dart:convert';

List<Tajwid> tajwidFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<Tajwid>.from(jsonData.map((x) => Tajwid.fromJson(x)));
}

String tajwidToJson(List<Tajwid> data) {
  final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class Tajwid {
  int nomor;
  String jenis;
  String nama;
  String deskripsi;
  List<String> huruf;
  String kesimpulan;
  String contoh1;
  String contoh2;
  String contoh3;

  Tajwid({
    required this.nomor,
    required this.jenis,
    required this.nama,
    required this.deskripsi,
    required this.huruf,
    required this.kesimpulan,
    required this.contoh1,
    required this.contoh2,
    required this.contoh3,
  });

  factory Tajwid.fromJson(Map<String, dynamic> json) => new Tajwid(
        nomor: json["nomor"],
        jenis: json["jenis"],
        nama: json["nama"],
        deskripsi: json["deskripsi"],
        huruf: new List<String>.from(json["huruf"].map((x) => x)),
        kesimpulan: json["kesimpulan"],
        contoh1: json["contoh_1"],
        contoh2: json["contoh_2"],
        contoh3: json["contoh_3"],
      );

  Map<String, dynamic> toJson() => {
        "nomor": nomor,
        "jenis": jenis,
        "nama": nama,
        "deskripsi": deskripsi,
        "huruf": new List<dynamic>.from(huruf.map((x) => x)),
        "kesimpulan": kesimpulan,
        "contoh_1": contoh1,
        "contoh_2": contoh2,
        "contoh_3": contoh3,
      };
}
