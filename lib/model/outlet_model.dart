part of 'models.dart';

class OutletModel extends Equatable {
  final int? id;
  final int? userId;
  final String? namaOutlet;
  final String? alamatOutlet;
  final String? namaPemilikOutlet;
  final String? nomerTlpOutlet;
  final String? region;
  final Cluster? cluster;
  final int? radius;
  final String? latlong;
  final String? statusOutlet;
  final UserModel? user;

  OutletModel({
    this.id,
    this.userId,
    this.namaOutlet,
    this.alamatOutlet,
    this.namaPemilikOutlet,
    this.nomerTlpOutlet,
    this.region,
    this.cluster,
    this.radius,
    this.latlong,
    this.statusOutlet,
    this.user,
  });

  factory OutletModel.fromJson(Map<String, dynamic> json) => OutletModel(
        id: json["id"],
        userId: json["user_id"],
        namaOutlet: json["nama_outlet"],
        alamatOutlet: json["alamat_outlet"],
        namaPemilikOutlet: json["nama_pemilik_outlet"],
        nomerTlpOutlet: json["nomer_tlp_outlet"],
        region: json["region"],
        cluster: Cluster.fromjson(json["cluster"]),
        radius: json["radius"],
        latlong: json["latlong"],
        statusOutlet: json["status_outlet"],
        user: UserModel.fromJson(
          json["user"],
        ),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "nama_outlet": namaOutlet,
        "alamat_outlet": alamatOutlet,
        "nama_pemilik_outlet": namaPemilikOutlet,
        "nomer_tlp_outlet": nomerTlpOutlet,
        "region": region,
        "cluster": cluster,
        "radius": radius,
        "latlong": latlong,
        "status_outlet": statusOutlet,
      };

  @override
  List<Object?> get props => [
        id,
        userId,
        namaOutlet,
        alamatOutlet,
        namaPemilikOutlet,
        nomerTlpOutlet,
        region,
        cluster,
        latlong,
        radius,
        statusOutlet,
        user
      ];
}
