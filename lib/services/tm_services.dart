part of 'services.dart';

class TmServices {
  static Future<ApiReturnValue<List<DivisiModel>>> getDivisi(
      {http.Client? client}) async {
    try {
      if (client == null) {
        client = http.Client();
      }

      String url = baseUrl + 'divisi';
      Uri uri = Uri.parse(url);
      SharedPreferences pref = await SharedPreferences.getInstance();

      var response = await client.get(uri, headers: {
        'Content-Type': "application/json",
        'Authorization': "Bearer ${pref.getString('token')}",
      });

      if (response.statusCode != 200) {
        return ApiReturnValue(value: [], message: 'gagal mendapatkan divisi');
      }

      var data = jsonDecode(response.body);

      List<DivisiModel> value = (data['data'] as Iterable)
          .map((e) => DivisiModel.fromJson(e))
          .toList();

      return ApiReturnValue(value: value);
    } catch (err) {
      return ApiReturnValue(value: [], message: err.toString());
    }
  }

  static Future<ApiReturnValue<List<RegionModel>>> getregion(String divisi,
      {http.Client? client}) async {
    try {
      if (client == null) {
        client = http.Client();
      }

      String url = baseUrl + 'region?divisi=$divisi';
      Uri uri = Uri.parse(url);
      SharedPreferences pref = await SharedPreferences.getInstance();

      var response = await client.get(uri, headers: {
        'Content-Type': "application/json",
        'Authorization': "Bearer ${pref.getString('token')}",
      });

      if (response.statusCode != 200) {
        return ApiReturnValue(value: [], message: 'gagal mengambil cluster');
      }

      var data = jsonDecode(response.body);

      List<RegionModel> value = (data['data'] as Iterable)
          .map((e) => RegionModel.fromJson(e))
          .toList();

      return ApiReturnValue(value: value);
    } catch (err) {
      return ApiReturnValue(value: [], message: err.toString());
    }
  }
}
