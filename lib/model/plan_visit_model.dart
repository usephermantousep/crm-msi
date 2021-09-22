part of 'models.dart';

class PlanVisitModel extends Equatable {
  final int? id;
  final DateTime? tanggalVisit;
  final OutletModel? outlet;

  PlanVisitModel({
    this.id,
    this.tanggalVisit,
    this.outlet,
  });

  PlanVisitModel copyWith({
    int? id,
    DateTime? tanggalVisit,
    UserModel? user,
    OutletModel? outlet,
  }) {
    return PlanVisitModel(
      id: id ?? this.id,
      tanggalVisit: tanggalVisit ?? this.tanggalVisit,
      outlet: outlet ?? this.outlet,
    );
  }

  @override
  List<Object?> get props => [
        id,
        tanggalVisit,
        outlet,
      ];

  factory PlanVisitModel.fromJson(Map<String, dynamic> json) => PlanVisitModel(
        id: json["id"],
        tanggalVisit:
            DateTime.fromMillisecondsSinceEpoch(json['tanggal_visit']),
        outlet: OutletModel.fromJson(json["outlet"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tanggal_visit": tanggalVisit.toString(),
        "outlet": outlet!.toJson(),
      };
}
