import 'package:intl/intl.dart';

void main() {
  List<Plan> plans = [
    Plan(
      outlet: "toko tuparev",
      tanggal: [
        DateTime.parse('2021-09-01'),
        DateTime.parse('2021-09-02'),
        DateTime.parse('2021-09-30'),
      ],
    ),
    Plan(
      outlet: "toko perum",
      tanggal: [
        DateTime.parse('2021-09-04'),
        DateTime.parse('2021-09-05'),
        DateTime.parse('2021-09-06'),
      ],
    ),
  ];

  for (Plan plan in plans) {
    List<String> tanggal = [];
    for (DateTime data in plan.tanggal!) {
      tanggal.add(
        DateFormat('d').format(data),
      );
    }
    print('${plan.outlet} || ${tanggal.join(',')}');
  }
}

class Plan {
  final String? outlet;
  final List<DateTime>? tanggal;

  Plan({this.outlet, this.tanggal});
}
