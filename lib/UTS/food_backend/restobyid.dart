class RestoById {
  final int status;
  final Data data;

  RestoById({
    required this.status,
    required this.data,
  });

  factory RestoById.fromJson(Map<String, dynamic> json) {
    return RestoById(
      status: json['status'],
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  final String id;
  final String nama;
  final String alamat;
  final double jarak;
  final String gambar;
  final List<Menu> menu;
  final int v;

  Data({
    required this.id,
    required this.nama,
    required this.alamat,
    required this.jarak,
    required this.gambar,
    required this.menu,
    required this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['_id'],
      nama: json['nama'],
      alamat: json['alamat'],
      jarak: json['jarak']?.toDouble() ?? 0.0,
      gambar: json['gambar'],
      menu: List<Menu>.from(json['menu'].map((x) => Menu.fromJson(x))),
      v: json['__v'],
    );
  }
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

  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(
      id: json['_id'],
      nama: json['nama'],
      harga: json['harga'],
      deskripsi: json['deskripsi'],
      gambar: json['gambar'],
      restoId: json['restoId'],
      v: json['__v'],
    );
  }
}
