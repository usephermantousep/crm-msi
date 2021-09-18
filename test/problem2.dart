import 'package:intl/intl.dart';

void main() {
  List<PlanVisit> planVisits = [
    PlanVisit(
      namaOutlet: 'toko tuparev',
      tanggal: DateTime.parse('2021-09-01'),
    ),
    PlanVisit(
      namaOutlet: 'toko tuparev',
      tanggal: DateTime.parse('2021-09-10'),
    ),
    PlanVisit(
      namaOutlet: 'toko tuparev',
      tanggal: DateTime.parse('2021-09-15'),
    ),
    PlanVisit(
      namaOutlet: 'toko perum',
      tanggal: DateTime.parse('2021-09-01'),
    ),
    PlanVisit(
      namaOutlet: 'toko perum',
      tanggal: DateTime.parse('2021-09-20'),
    ),
    PlanVisit(
      namaOutlet: 'toko perum',
      tanggal: DateTime.parse('2021-09-30'),
    ),
  ];

  List<String> unique = planVisits.map((e) => e.namaOutlet!).toSet().toList();
  for (String item in unique) {
    List<String> tanggal = [];
    for (PlanVisit plan in planVisits) {
      if (plan.namaOutlet == item) {
        tanggal.add(DateFormat('d').format(plan.tanggal!));
      }
    }
    print('$item || ${tanggal.join(',')}');
  }
}

class PlanVisit {
  final String? namaOutlet;
  final DateTime? tanggal;

  PlanVisit({this.namaOutlet, this.tanggal});
}
