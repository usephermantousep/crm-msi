part of 'services.dart';

class OutletServices {
  static Future<ApiReturnValue<List<OutletModel>>> getOutlet(
      {http.Client? client}) async {
    try {
      client ??= http.Client();

      String url = baseUrl + 'outlet';
      Uri uri = Uri.parse(url);
      SharedPreferences pref = await SharedPreferences.getInstance();


      var response = await client.get(uri, headers: {
        'Content-Type': "application/json",
        'Authorization': "Bearer ${pref.getString('token')}",
      });

      if (response.statusCode != 200) {
        return ApiReturnValue(message: 'Please reload the App');
      }

      var data = jsonDecode(response.body);
      List<OutletModel> outlets = (data['data'] as Iterable)
          .map((e) => OutletModel.fromJson(e))
          .toList();
      return ApiReturnValue(value: outlets);
    } catch ($err) {
      return ApiReturnValue(message: $err.toString());
    }
  }

  static Future<ApiReturnValue<OutletModel>> getSingleOutlet(String namaOutlet,
      {http.Client? client}) async {
    try {
      if (client == null) {
        client = http.Client();
      }

      String url = baseUrl + 'outlet/$namaOutlet';
      Uri uri = Uri.parse(url);
      SharedPreferences pref = await SharedPreferences.getInstance();


      var response = await http.get(uri, headers: {
        'Content-Type': "application/json",
        'Authorization': "Bearer ${pref.getString('token')}",
      });

      if (response.statusCode != 200) {
        var data = jsonDecode(response.body);
        String message = data['message'];
        return ApiReturnValue(message: message);
      }

      var data = jsonDecode(response.body);

      OutletModel value = OutletModel.fromJson(data['data'][0]);
      return ApiReturnValue(value: value);
    } catch ($err) {
      return ApiReturnValue(message: $err.toString());
    }
  }
}
