part of 'models.dart';

enum NooStatus { pending, confirmed, approved, rejected }

class NooModel extends Equatable {
  NooModel({
    this.id,
    this.userId,
    this.namaOutlet,
    this.alamatOutlet,
    this.namaPemilikOutlet,
    this.nomerTlpOutlet,
    this.nomerWakilOutlet,
    this.ktpOutlet,
    this.kota,
    this.region,
    this.clusterId,
    this.potoShopSign,
    this.potoEtalase,
    this.potoDepan,
    this.potoKiri,
    this.potoKanan,
    this.potoBelakang,
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
    this.confirmedAt,
    this.confirmedBy,
    this.rejectedAt,
    this.rejectedBy,
    this.approvedBy,
    this.approvedAt,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.keterangan,
    this.user,
    this.cluster,
  });

  final int? id;
  final int? userId;
  final String? namaOutlet;
  final String? alamatOutlet;
  final String? namaPemilikOutlet;
  final String? nomerTlpOutlet;
  final String? nomerWakilOutlet;
  final String? ktpOutlet;
  final String? kota;
  final String? region;
  final int? clusterId;
  final String? potoShopSign;
  final String? potoEtalase;
  final String? potoDepan;
  final String? potoKiri;
  final String? potoKanan;
  final String? potoBelakang;
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
  final DateTime? confirmedAt;
  final String? confirmedBy;
  final DateTime? rejectedAt;
  final String? rejectedBy;
  final DateTime? approvedAt;
  final String? approvedBy;
  final DateTime? deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? keterangan;
  final UserModel? user;
  final Cluster? cluster;

  factory NooModel.fromJson(Map<String, dynamic> json) => NooModel(
        id: json["id"],
        userId: json["user_id"],
        namaOutlet: json["nama_outlet"],
        alamatOutlet: json["alamat_outlet"],
        namaPemilikOutlet: json["nama_pemilik_outlet"],
        nomerTlpOutlet: json["nomer_tlp_outlet"],
        nomerWakilOutlet: json["nomer_wakil_outlet"],
        ktpOutlet: json["ktp_outlet"],
        kota: json["kota"],
        region: json["region"],
        clusterId: json["cluster_id"],
        potoShopSign: json["poto_shop_sign"],
        potoEtalase: json["poto_etalase"],
        potoDepan: json["poto_depan"],
        potoKiri: json["poto_kiri"],
        potoKanan: json["poto_kanan"],
        potoBelakang: json["poto_belakang"],
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
            : (json["status"] == 'CONFIRMED')
                ? NooStatus.confirmed
                : (json["status"] == 'APPROVED')
                    ? NooStatus.approved
                    : NooStatus.rejected,
        confirmedAt: (json["confirmed_at"] == null)
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json["confirmed_at"]),
        confirmedBy: json["confirmed_by"],
        rejectedAt: (json["rejected_at"] == null)
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json["rejected_at"]),
        rejectedBy: json["rejected_by"],
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
        user: UserModel.fromJson(json["user"]),
        cluster: Cluster.fromjson(json["cluster"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "nama_outlet": namaOutlet,
        "alamat_outlet": alamatOutlet,
        "nama_pemilik_outlet": namaPemilikOutlet,
        "nomer_tlp_outlet": nomerTlpOutlet,
        "nomer_wakil_outlet": nomerWakilOutlet,
        "ktp_outlet": ktpOutlet,
        "kota": kota,
        "region": region,
        "cluster_id": clusterId,
        "poto_shop_sign": potoShopSign,
        "poto_etalase": potoEtalase,
        "poto_depan": potoDepan,
        "poto_kiri": potoKiri,
        "poto_kanan": potoKanan,
        "poto_belakang": potoBelakang,
        "video": video,
        "oppo": oppo,
        "vivo": vivo,
        "realme": realme,
        "samsung": samsung,
        "xiaomi": xiaomi,
        "fl": fl,
        "latlong": latlong,
        "limit": limit,
        "status": status,
        "confirmed_at": confirmedAt,
        "confirmed_by": confirmedBy,
        "rejected_at": rejectedAt,
        "rejected_by": rejectedBy,
        "approved_at": approvedAt,
        "approved_by": approvedBy,
        "deleted_at": deletedAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "keterangan": keterangan,
        "user": user!.toJson(),
        "cluster": cluster!.toJson(),
      };

  @override
  List<Object?> get props => [
        id,
        userId,
        namaOutlet,
        alamatOutlet,
        namaPemilikOutlet,
        nomerTlpOutlet,
        nomerWakilOutlet,
        ktpOutlet,
        kota,
        region,
        clusterId,
        potoShopSign,
        potoEtalase,
        potoDepan,
        potoKiri,
        potoKanan,
        potoBelakang,
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
        confirmedAt,
        confirmedBy,
        rejectedAt,
        rejectedBy,
        approvedAt,
        approvedBy,
        deletedAt,
        createdAt,
        updatedAt,
        keterangan,
        user,
        cluster,
      ];
}
