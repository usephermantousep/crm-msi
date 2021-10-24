part of 'models.dart';

enum NooStatus { pending, confirmed, approved, rejected }

class NooModel extends Equatable {
  NooModel({
    this.id,
    this.kodeOutlet,
    this.namaOutlet,
    this.alamatOutlet,
    this.namaPemilikOutlet,
    this.nomerTlpOutlet,
    this.nomerWakilOutlet,
    this.ktpOutlet,
    this.distric,
    this.region,
    this.potoShopSign,
    this.potoEtalase,
    this.potoDepan,
    this.potoKiri,
    this.potoKanan,
    this.potoBelakang,
    this.potoKtp,
    this.video,
    this.oppo,
    this.vivo,
    this.realme,
    this.samsung,
    this.xiaomi,
    this.fl,
    this.latlong,
    this.limit,
    this.status,
    this.rejectedAt,
    this.rejectedBy,
    this.approvedBy,
    this.approvedAt,
    this.confirmedBy,
    this.confirmedAt,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.keterangan,
    this.cluster,
    this.badanUsaha,
    this.divisi,
    this.createdBy,
  });

  final int? id;
  final String? kodeOutlet;
  final String? namaOutlet;
  final String? alamatOutlet;
  final String? namaPemilikOutlet;
  final String? nomerTlpOutlet;
  final String? nomerWakilOutlet;
  final String? ktpOutlet;
  final String? distric;
  final RegionModel? region;
  final String? potoShopSign;
  final String? potoEtalase;
  final String? potoDepan;
  final String? potoKiri;
  final String? potoKanan;
  final String? potoBelakang;
  final String? potoKtp;
  final String? video;
  final String? oppo;
  final String? vivo;
  final String? realme;
  final String? samsung;
  final String? xiaomi;
  final String? fl;
  final String? latlong;
  final int? limit;
  final NooStatus? status;
  final DateTime? rejectedAt;
  final String? rejectedBy;
  final DateTime? confirmedAt;
  final String? confirmedBy;
  final DateTime? approvedAt;
  final String? approvedBy;
  final DateTime? deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? keterangan;
  final ClusterModel? cluster;
  final BadanUsahaModel? badanUsaha;
  final DivisiModel? divisi;
  final String? createdBy;

  factory NooModel.fromJson(Map<String, dynamic> json) => NooModel(
        id: json["id"],
        kodeOutlet: json['kode_outlet'],
        namaOutlet: json["nama_outlet"],
        alamatOutlet: json["alamat_outlet"],
        namaPemilikOutlet: json["nama_pemilik_outlet"],
        nomerTlpOutlet: json["nomer_tlp_outlet"],
        nomerWakilOutlet: json["nomer_wakil_outlet"],
        ktpOutlet: json["ktp_outlet"],
        distric: json["distric"],
        region: RegionModel.fromJson(json["region"]),
        potoShopSign: json["poto_shop_sign"],
        potoEtalase: json["poto_etalase"],
        potoDepan: json["poto_depan"],
        potoKiri: json["poto_kiri"],
        potoKanan: json["poto_kanan"],
        potoBelakang: json["poto_belakang"],
        potoKtp: json['poto_ktp'],
        video: json["video"],
        oppo: json["oppo"],
        vivo: json["vivo"],
        realme: json["realme"],
        samsung: json["samsung"],
        xiaomi: json["xiaomi"],
        fl: json["fl"],
        latlong: json["latlong"],
        limit: json["limit"],
        status: (json["status"] == 'PENDING')
            ? NooStatus.pending
            : (json["status"] == "CONFIRMED")
                ? NooStatus.confirmed
                : (json["status"] == 'APPROVED')
                    ? NooStatus.approved
                    : NooStatus.rejected,
        rejectedAt: (json["rejected_at"] == null)
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json["rejected_at"]),
        rejectedBy: json["rejected_by"],
        confirmedBy: json['confirmed_by'],
        confirmedAt: (json["confirmed_at"] == null)
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json["confirmed_at"]),
        approvedBy: json['approved_by'],
        approvedAt: (json["approved_at"] == null)
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json["approved_at"]),
        deletedAt: (json["deleted_at"] == null)
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json["deleted_at"]),
        createdAt: (json["created_at"] == null)
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json["created_at"]),
        updatedAt: (json["updated_at"] == null)
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json["updated_at"]),
        keterangan: json['keterangan'],
        cluster: ClusterModel.fromJson(json["cluster"]),
        badanUsaha: BadanUsahaModel.fromJson(json['badanusaha']),
        divisi: DivisiModel.fromJson(json['divisi']),
        createdBy: json['created_by'],
      );

  @override
  List<Object?> get props => [
        id,
        kodeOutlet,
        namaOutlet,
        alamatOutlet,
        namaPemilikOutlet,
        nomerTlpOutlet,
        nomerWakilOutlet,
        ktpOutlet,
        distric,
        region,
        potoShopSign,
        potoEtalase,
        potoDepan,
        potoKiri,
        potoKanan,
        potoBelakang,
        potoKtp,
        video,
        oppo,
        vivo,
        realme,
        samsung,
        xiaomi,
        fl,
        latlong,
        limit,
        status,
        rejectedAt,
        rejectedBy,
        approvedAt,
        approvedBy,
        confirmedBy,
        confirmedAt,
        deletedAt,
        createdAt,
        updatedAt,
        keterangan,
        cluster,
        badanUsaha,
        divisi,
        createdBy,
      ];
}
