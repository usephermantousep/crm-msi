part of 'services.dart';

class NooService {
  static Future<ApiReturnValue<List<NooModel>>> bySales(int id) async {
    await Future.delayed(Duration(milliseconds: 500));

    return ApiReturnValue(value: mockNoo);
  }
}
