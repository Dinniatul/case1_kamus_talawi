// To parse this JSON data, do
//
//     final modelListKosaKata = modelListKosaKataFromJson(jsonString);

import 'dart:convert';

ModelListKosaKata modelListKosaKataFromJson(String str) => ModelListKosaKata.fromJson(json.decode(str));

String modelListKosaKataToJson(ModelListKosaKata data) => json.encode(data.toJson());

class ModelListKosaKata {
  bool success;
  String message;
  List<Datum> data;

  ModelListKosaKata({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ModelListKosaKata.fromJson(Map<String, dynamic> json) => ModelListKosaKata(
    success: json["success"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  int id;
  String kosaKata;
  String arti;
  String detail;
  String ucapanTalawi;
  String ucapanIndonesia;
  DateTime createdAt;
  DateTime updatedAt;

  Datum({
    required this.id,
    required this.kosaKata,
    required this.arti,
    required this.detail,
    required this.ucapanTalawi,
    required this.ucapanIndonesia,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    kosaKata: json["kosa_kata"],
    arti: json["arti"],
    detail: json["detail"],
    ucapanTalawi: json["ucapan_talawi"],
    ucapanIndonesia: json["ucapan_indonesia"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "kosa_kata": kosaKata,
    "arti": arti,
    "detail": detail,
    "ucapan_talawi": ucapanTalawi,
    "ucapan_indonesia": ucapanIndonesia,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
