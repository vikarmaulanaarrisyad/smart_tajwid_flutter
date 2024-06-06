import 'dart:convert';

List<Tajwid> tajwidFromJson(String str) {
  final jsonData = json.decode(str);
  return List<Tajwid>.from(jsonData.map((x) => Tajwid.fromJson(x)));
}

String tajwidToJson(List<Tajwid> data) {
  final dyn = List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class Tajwid {
  int nomor;
  String jenis;
  String nama;
  String deskripsi;
  String keterangan;
  List<String> huruf;
  String nadhom;
  List<String> hurufNadhom;
  String kesimpulan;
  String contoh;
  String contoh1;
  String contoh2;
  String contoh3;

  Tajwid({
    required this.nomor,
    required this.jenis,
    required this.nama,
    required this.deskripsi,
    required this.keterangan,
    required this.huruf,
    required this.nadhom,
    required this.hurufNadhom,
    required this.kesimpulan,
    required this.contoh,
    required this.contoh1,
    required this.contoh2,
    required this.contoh3,
  });

  factory Tajwid.fromJson(Map<String, dynamic> json) => Tajwid(
        nomor: json["nomor"],
        jenis: json["jenis"],
        nama: json["nama"],
        deskripsi: json["deskripsi"],
        keterangan: json["keterangan"] ?? '',
        huruf: List<String>.from(json["huruf"]),
        nadhom: json["nadhom"],
        hurufNadhom: List<String>.from(json["huruf_nadhom"]),
        kesimpulan: json["kesimpulan"],
        contoh: json["contoh"],
        contoh1: json["contoh_1"],
        contoh2: json["contoh_2"],
        contoh3: json["contoh_3"],
      );

  Map<String, dynamic> toJson() => {
        "nomor": nomor,
        "jenis": jenis,
        "nama": nama,
        "deskripsi": deskripsi,
        "keterangan": keterangan,
        "huruf": huruf,
        "nadhom": nadhom,
        "huruf_nadhom": hurufNadhom,
        "kesimpulan": kesimpulan,
        "contoh": contoh,
        "contoh_1": contoh1,
        "contoh_2": contoh2,
        "contoh_3": contoh3,
      };
}
