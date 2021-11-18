part of 'services.dart';

class OutletServices {
  static Future<ApiReturnValue<List<OutletModel>>> getOutlet(
      {http.Client? client, String? divisi, String? region}) async {
    try {
      client ??= http.Client();

      String url = (divisi != null)
          ? baseUrl + 'outlet?region=$region&divisi=$divisi'
          : baseUrl + 'outlet';
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
    } catch (err) {
      return ApiReturnValue(message: err.toString());
    }
  }

  static Future<ApiReturnValue<OutletModel>> getSingleOutlet(String namaOutlet,
      {http.Client? client}) async {
    try {
      if (client == null) {
        client = http.Client();
      }
      String kodeOutlet = namaOutlet.split(' ').last;

      String url = baseUrl + 'outlet/$kodeOutlet';
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
      print($err);
      return ApiReturnValue(message: $err.toString());
    }
  }

  static Future<ApiReturnValue<bool>> updateOutlet(
      List<File> images,
      String namaOutlet,
      String namaPemilik,
      String nomerPemilik,
      String latlong,
      File video,
      {http.MultipartRequest? client}) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String kodeOutlet = namaOutlet.split(' ').last;
      String url = baseUrl + 'outlet';
      Uri uri = Uri.parse(url);
      if (client == null) {
        client = http.MultipartRequest('POST', uri)
          ..headers["Content-Type"] = "application/json"
          ..headers["Authorization"] = "Bearer ${pref.getString('token')}"
          ..fields['kode_outlet'] = kodeOutlet
          ..fields['nama_pemilik_outlet'] = namaPemilik
          ..fields['nomer_tlp_outlet'] = nomerPemilik
          ..fields['latlong'] = latlong;
      }

      for (int i = 0; i < images.length; i++) {
        String fileName = images[i].path.split('/').last;
        var stream = new http.ByteStream(images[i].openRead());

        var length = await images[i].length();

        var multiPartImage = new http.MultipartFile('photo$i', stream, length,
            filename: fileName);

        client.files.add(multiPartImage);
      }

      var multiPartFileVideo =
          await http.MultipartFile.fromPath('video', video.path);
      client.files.add(multiPartFileVideo);

      var response = await client.send();
      print(response.statusCode);

      if (response.statusCode != 200) {
        print(response.statusCode);
        return ApiReturnValue(value: false, message: "Gagal Upload Foto");
      }

      return ApiReturnValue(value: true, message: "Berhasil Upload Foto");
    } catch (err) {
      print(err.toString());
      return ApiReturnValue(value: false, message: err.toString());
    }
  }
}
