part of 'models.dart';

class VisitModel extends Equatable {
  final int? id;
  final DateTime? tanggalVisit;
  final int? userId;
  final int? outletId;
  final String? tipeVisit;
  final String? latlongIn;
  final String? latlongOut;
  final DateTime? checkInTime;
  final DateTime? checkOutTime;
  final String? laporanVisit;
  final int? durasiVisit;
  final String? pictureVisitIn;
  final String? pictureVisitOut;
  final OutletModel? outlet;
  final UserModel? user;
  final String? transaksi;

  VisitModel({
    this.id,
    this.userId,
    this.outletId,
    this.tipeVisit,
    this.tanggalVisit,
    this.latlongIn,
    this.latlongOut,
    this.checkInTime,
    this.checkOutTime,
    this.laporanVisit,
    this.pictureVisitIn,
    this.pictureVisitOut,
    this.durasiVisit,
    this.outlet,
    this.user,
    this.transaksi,
  });

  @override
  List<Object?> get props => [
        id,
        userId,
        outletId,
        tipeVisit,
        tanggalVisit,
        latlongIn,
        latlongOut,
        checkInTime,
        checkOutTime,
        laporanVisit,
        pictureVisitIn,
        pictureVisitOut,
        durasiVisit,
        outlet,
        user,
        transaksi,
      ];

  factory VisitModel.fromJson(Map<String, dynamic> json) => VisitModel(
        id: json["id"],
        tanggalVisit:
            DateTime.fromMillisecondsSinceEpoch(json["tanggal_visit"]),
        userId: json["user_id"],
        outletId: json["outlet_id"],
        tipeVisit: json["tipe_visit"],
        latlongIn: json["latlong_in"],
        latlongOut: json["latlong_out"],
        checkInTime: DateTime.fromMillisecondsSinceEpoch(json["check_in_time"]),
        checkOutTime: (json["check_out_time"] == null)
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json["check_out_time"]),
        laporanVisit: json["laporan_visit"],
        durasiVisit: json["durasi_visit"],
        pictureVisitIn: json["picture_visit_in"],
        pictureVisitOut: json["picture_visit_out"],
        outlet: OutletModel.fromJson(json["outlet"]),
        user: UserModel.fromJson(json["user"]),
        transaksi: json["transaksi"],
      );
}

List<VisitModel> mockMonitor = [
  VisitModel(
    tanggalVisit: DateTime(2021, 11, 29),
    user: UserModel(namaLengkap: 'Usep Hermanto'),
    outlet: OutletModel(
      namaOutlet: "outlet ini",
      region: RegionModel(name: 'SWJ'),
      cluster: ClusterModel(name: 'CSW1'),
    ),
    checkInTime: DateTime.now(),
  ),
];
