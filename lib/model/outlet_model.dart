part of 'models.dart';

class OutletModel extends Equatable {
  final int? id;
  final String? kodeOutlet;
  final BadanUsahaModel? badanUsaha;
  final String? namaOutlet;
  final String? alamatOutlet;
  final String? namaPemilikOutlet;
  final String? nomerTlpOutlet;
  final String? potoShopSign;
  final String? potoDepan;
  final String? potoKiri;
  final String? potoKanan;
  final String? potoKtp;
  final String? distric;
  final String? video;
  final int? limit;
  final RegionModel? region;
  final ClusterModel? cluster;
  final DivisiModel? divisi;
  final int? radius;
  final String? latlong;
  final String? statusOutlet;

  factory OutletModel.fromJson(Map<String, dynamic> json) => OutletModel(
        id: json["id"],
        kodeOutlet: json["kode_outlet"],
        namaOutlet: json["nama_outlet"],
        alamatOutlet: json["alamat_outlet"],
        namaPemilikOutlet: json["nama_pemilik_outlet"],
        nomerTlpOutlet: json["nomer_tlp_outlet"],
        distric: json['distric'],
        badanUsaha: BadanUsahaModel.fromJson(json["badanusaha"]),
        potoShopSign: json["poto_shop_sign"],
        potoDepan: json["poto_depan"],
        potoKiri: json["poto_kiri"],
        potoKanan: json["poto_kanan"],
        potoKtp: json["poto_ktp"],
        limit: json["limit"],
        radius: json["radius"],
        latlong: json["latlong"],
        video: json["video"],
        statusOutlet: json["status_outlet"],
        cluster: ClusterModel.fromJson(json["cluster"]),
        region: RegionModel.fromJson(json["region"]),
        divisi: DivisiModel.fromJson(json["divisi"]),
      );

  OutletModel({
    this.id,
    this.kodeOutlet,
    this.namaOutlet,
    this.alamatOutlet,
    this.namaPemilikOutlet,
    this.nomerTlpOutlet,
    this.distric,
    this.badanUsaha,
    this.potoShopSign,
    this.potoDepan,
    this.potoKiri,
    this.potoKanan,
    this.potoKtp,
    this.video,
    this.limit,
    this.radius,
    this.latlong,
    this.divisi,
    this.statusOutlet,
    this.cluster,
    this.region,
  });

  @override
  List<Object?> get props => [
        id,
        kodeOutlet,
        namaOutlet,
        alamatOutlet,
        namaPemilikOutlet,
        nomerTlpOutlet,
        badanUsaha,
        distric,
        potoShopSign,
        potoDepan,
        potoKiri,
        potoKanan,
        potoKtp,
        limit,
        radius,
        video,
        latlong,
        divisi,
        statusOutlet,
        cluster,
        region,
      ];
}
