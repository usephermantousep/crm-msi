part of 'models.dart';

class PlanVisitModel extends Equatable {
  final int? id;
  final OutletModel? outlet;
  final String? bulan;
  final String? namaOutlet;
  final String? namaSales;

  PlanVisitModel({
    this.id,
    this.outlet,
    this.bulan,
    this.namaOutlet,
    this.namaSales,
  });
  @override
  List<Object?> get props => [id, outlet, bulan, namaOutlet, namaSales];
}

List<PlanVisitModel> mockPlan = [
  PlanVisitModel(
      id: 1,
      outlet: mockOutlet[0],
      bulan: "Aug",
      namaOutlet: "TOKO TUPAREV",
      namaSales: "USEP HERMANTO"),
];
