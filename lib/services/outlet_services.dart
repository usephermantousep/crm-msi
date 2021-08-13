part of 'services.dart';

class OutletServices {
  static Future<ApiReturnValue<List<OutletModel>>> getOutlet(int idSales,
      {http.Client? client}) async {
    // client ??= http.Client();

    // String url = baseUrl + 'outlet/?user_id=1';
    // Uri uri = Uri.parse(url);

    // var response = await client.get(uri);

    // if (response.statusCode != 200) {
    //   return ApiReturnValue(message: 'Please reload the App');
    // }

    // var data = jsonDecode(response.body);
    // List<OutletModel> outlets = (data['data']['outlet'] as Iterable)
    //     .map((e) => OutletModel.fromJson(e))
    //     .toList();

    // return ApiReturnValue(value: outlets);

    await Future.delayed(Duration(milliseconds: 500));

    return ApiReturnValue(value: mockOutlet);
  }
}
