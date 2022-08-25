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
    SharedPreferences pref = await SharedPreferences.getInstance();

    var response = await client.get(uri, headers: {
      'Content-Type': "application/json",
      'Authorization': "Bearer ${pref.getString('token')}",
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
    SharedPreferences pref = await SharedPreferences.getInstance();

    var response = await client.get(uri, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${pref.getString('token')}'
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

  static Future<ApiReturnValue<bool>> addPlanVisit(
      String date, String kodeOutlet,
      {http.Client? client}) async {
    try {
      if (client == null) {
        client = http.Client();
      }

      String url = baseUrl + 'planvisit';
      Uri uri = Uri.parse(url);
      SharedPreferences pref = await SharedPreferences.getInstance();

      var response = await client.post(uri, body: {
        'tanggal_visit': date,
        'kode_outlet': kodeOutlet
      }, headers: {
        'Application': "application/json",
        'Authorization': "Bearer ${pref.getString('token')}",
      });

      if (response.statusCode != 200) {
        var data = jsonDecode(response.body);
        String message = data['meta']['message'];
        return ApiReturnValue(value: false, message: message);
      }

      return ApiReturnValue(value: true);
    } catch (err) {
      return ApiReturnValue(value: false, message: err.toString());
    }
  }

  static Future<ApiReturnValue<bool>> deletePlanVisit(
      String kodeOutlet, String tahun, String bulan,
      {http.Client? client}) async {
    if (client == null) {
      client = http.Client();
    }

    try {
      String url = baseUrl + 'planvisit';
      Uri uri = Uri.parse(url);
      SharedPreferences pref = await SharedPreferences.getInstance();

      var response = await client.delete(uri, headers: <String, String>{
        'Application': "application/json",
        'Authorization': "Bearer ${pref.getString('token')}",
      }, body: <String, String>{
        'bulan': bulan,
        'tahun': tahun,
        'kode_outlet': kodeOutlet,
      });

      if (response.statusCode != 200) {
        var data = jsonDecode(response.body);
        String message = data['meta']['message'];
        return ApiReturnValue(value: false, message: message);
      }

      return ApiReturnValue(value: true, message: 'Berhasil hapus plan visit');
    } catch (err) {
      return ApiReturnValue(value: false, message: err.toString());
    }
  }
}
