part of 'models.dart';

class PlanVisitModel extends Equatable {
  final int? id;
  final String? bulan;
  final String? namaOutlet;
  final String? namaSales;

  PlanVisitModel({
    this.id,
    this.bulan,
    this.namaOutlet,
    this.namaSales,
  });
  @override
  List<Object?> get props => [id, bulan, namaOutlet, namaSales];
}

List<PlanVisitModel> mockPlan = [
  PlanVisitModel(
      id: 1,
      bulan: "Aug",
      namaOutlet: "TOKO TUPAREV",
      namaSales: "USEP HERMANTO"),
];
