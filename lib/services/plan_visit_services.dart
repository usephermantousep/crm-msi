part of 'services.dart';

class PlanVisitServices {
  static String getDate({bool? tanggal}) {
    var now = new DateTime.now();
    if (tanggal != null) {
      return new DateFormat("yyyy-MM-dd").format(now);
    }
    return '';
  }

  static Future<ApiReturnValue<List<PlanVisitModel>>> getPlanVisit(
      {http.Client? client}) async {
    if (client == null) {
      client = http.Client();
    }
    String tanggal = getDate(tanggal: true);

    String url = baseUrl + 'planvisit/?tanggal=$tanggal';
    Uri uri = Uri.parse(url);

    var response = await client.get(uri, headers: {
      'Content-Type': "application/json",
      'Authorization': "Bearer ${UserModel.token!}",
    });

    if (response.statusCode != 200) {
      var data = jsonDecode(response.body);
      String message = data['message'];
      return ApiReturnValue(message: message);
    }

    var data = jsonDecode(response.body);
    List<PlanVisitModel> value = (data['data'] as Iterable)
        .map((e) => PlanVisitModel.fromJson(e))
        .toList();
    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<List<PlanVisitModel>>> getPlanbyMonth(
      String tahun, String bulan,
      {http.Client? client}) async {
    if (client == null) {
      client = http.Client();
    }

    String url = baseUrl + 'planvisit/filter/?tahun=$tahun&bulan=$bulan';
    Uri uri = Uri.parse(url);

    var response = await client.get(uri, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${UserModel.token}'
    });

    if (response.statusCode != 200) {
      var data = jsonDecode(response.body);
      String message = data['meta']['message'];
      return ApiReturnValue(message: message);
    }

    var data = jsonDecode(response.body);

    List<PlanVisitModel> value = (data['data'] as Iterable)
        .map((e) => PlanVisitModel.fromJson(e))
        .toList();

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<bool>> addPlanVisit(String date, String outlet,
      {http.Client? client}) async {
    try {
      if (client == null) {
        client = http.Client();
      }

      String url = baseUrl + 'planvisit';
      Uri uri = Uri.parse(url);

      var response = await client.post(uri, body: {
        'tanggal_visit': date,
        'nama_outlet': outlet
      }, headers: {
        'Application': "application/json",
        'Authorization': "Bearer ${UserModel.token!}",
      });
      print(response.statusCode);

      if (response.statusCode != 200) {
        var data = jsonDecode(response.body);
        String message = data['meta']['message'];
        return ApiReturnValue(message: message);
      }

      return ApiReturnValue(value: true);
    } catch (err) {
      return ApiReturnValue(value: false, message: err.toString());
    }
  }
}
