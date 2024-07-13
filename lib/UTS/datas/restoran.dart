class Restaurant {
  final String id;
  final String nama;
  final String alamat;
  final String imageUrl;
  final List<String> menuIds;

  Restaurant({
    required this.id,
    required this.nama,
    required this.alamat,
    required this.imageUrl,
    required this.menuIds,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['_id'],
      nama: json['nama'],
      alamat: json['alamat'],
      imageUrl: json['gambar'],
      menuIds: List<String>.from(json['menu']),
    );
  }
}
