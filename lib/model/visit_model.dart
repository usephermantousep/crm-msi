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
        checkOutTime:
            DateTime.fromMillisecondsSinceEpoch(json["check_out_time"]),
        laporanVisit: json["laporan_visit"],
        durasiVisit: json["durasi_visit"],
        pictureVisitIn: json["picture_visit_in"],
        pictureVisitOut: json["picture_visit_out"],
        outlet: OutletModel.fromJson(json["outlet"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tanggal_visit": tanggalVisit,
        "user_id": userId,
        "outlet_id": outletId,
        "tipe_visit": tipeVisit,
        "latlong_in": latlongIn,
        "latlong_out": latlongOut,
        "check_in_time": checkInTime,
        "check_out_time": checkOutTime,
        "laporan_visit": laporanVisit,
        "durasi_visit": durasiVisit,
        "picture_visit_in": pictureVisitIn,
        "picture_visit_out": pictureVisitOut,
        "outlet": outlet!.toJson(),
      };
}
