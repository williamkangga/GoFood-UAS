// ignore_for_file: file_names

import 'dart:convert';

import 'package:gojek/UTS/datas/restoran.dart';

RestoModel dataFromJson(String str) => RestoModel.fromJson(json.decode(str));

String dataToJson(RestoModel data) => json.encode(data.toJson());

class RestoModel {
  final int status;
  final List<Restaurant> data;

  RestoModel({
    required this.status,
    required this.data,
  });

  factory RestoModel.fromJson(Map<String, dynamic> json) => RestoModel(
        status: json["status"],
        data: List<Restaurant>.from(
            json["data"].map((x) => Restaurant.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Restaurant {
  final String id;
  final String nama;
  final String alamat;
  final double jarak;
  final String gambar;
  final List<Menu> menu;
  final int v;

  Restaurant({
    required this.id,
    required this.nama,
    required this.alamat,
    required this.jarak,
    required this.gambar,
    required this.menu,
    required this.v,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        id: json["_id"], //string
        nama: json["nama"], //str
        alamat: json["alamat"], //str
        jarak: json["jarak"]?.toDouble(),
        gambar: json["gambar"], //str
        menu: List<Menu>.from(json["menu"].map((x) => Menu.fromJson(x))),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "nama": nama,
        "alamat": alamat,
        "jarak": jarak,
        "gambar": gambar,
        "menu": List<dynamic>.from(menu.map((x) => x.toJson())),
        "__v": v,
      };
}

class Menu {
  final String id;
  final String nama;
  final int harga;
  final String deskripsi;
  final String gambar;
  final String restoId;
  final int v;

  Menu({
    required this.id,
    required this.nama,
    required this.harga,
    required this.deskripsi,
    required this.gambar,
    required this.restoId,
    required this.v,
  });

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        id: json["_id"],
        nama: json["nama"],
        harga: json["harga"],
        deskripsi: json["deskripsi"],
        gambar: json["gambar"],
        restoId: json["restoId"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "nama": nama,
        "harga": harga,
        "deskripsi": deskripsi,
        "gambar": gambar,
        "restoId": restoId,
        "__v": v,
      };
}
