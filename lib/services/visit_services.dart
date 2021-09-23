part of 'services.dart';

class VisitServices {
  static Future<ApiReturnValue<bool>> submit(String namaOutlet, String latlong,
      File pictureFile, bool checkin, String tipeVisit,
      {http.MultipartRequest? request, String? laporan}) async {
    try {
      String url = baseUrl + 'visit';
      Uri uri = Uri.parse(url);
      SharedPreferences pref = await SharedPreferences.getInstance();
      if (request == null) {
        request = http.MultipartRequest("POST", uri)
          ..headers["Content-Type"] = "application/json"
          ..headers["Authorization"] = "Bearer ${pref.getString('token')}";
      }

      var multiPartFile =
          await http.MultipartFile.fromPath('picture_visit', pictureFile.path);

      if (checkin) {
        request
          ..fields['nama_outlet'] = namaOutlet
          ..fields['latlong_in'] = latlong
          ..fields['tipe_visit'] = tipeVisit
          ..files.add(multiPartFile);
      } else {
        request
          ..fields['latlong_out'] = latlong
          ..fields['laporan_visit'] = laporan!
          ..files.add(multiPartFile);
      }

      var response = await request.send();

      if (response.statusCode != 200) {
        return ApiReturnValue(
            message: 'Ada permasalahan pada server', value: false);
      }

      return ApiReturnValue(value: true);
    } catch (err) {
      return ApiReturnValue(value: false, message: err.toString());
    }
  }

  static Future<ApiReturnValue<List<VisitModel>>> getVisit(
      {http.Client? client}) async {
    if (client == null) {
      client = http.Client();
    }

    try {
      String url = baseUrl + 'visit';
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

      List<VisitModel> value = (data['data'] as Iterable)
          .map((e) => VisitModel.fromJson(e))
          .toList();

      return ApiReturnValue(value: value);
    } catch ($err) {
      return ApiReturnValue(message: $err.toString());
    }
  }

  static Future<ApiReturnValue<bool>> check(String namaOutlet, bool checkin,
      {http.Client? client}) async {
    if (client == null) {
      client = http.Client();
    }

    String url = (checkin)
        ? baseUrl + "visit/check/?nama_outlet=$namaOutlet&check_in=$checkin"
        : baseUrl + "visit/check/?nama_outlet=$namaOutlet";
    Uri uri = Uri.parse(url);

    SharedPreferences pref = await SharedPreferences.getInstance();

    var response = await client.get(uri, headers: {
      'Content-Type': "application/json",
      'Authorization': "Bearer ${pref.getString('token')}",
    });

    if (response.statusCode != 200) {
      var data = jsonDecode(response.body);
      String message = data['meta']['message'];
      return ApiReturnValue(value: false, message: message);
    }

    return ApiReturnValue(value: true);
  }
}
