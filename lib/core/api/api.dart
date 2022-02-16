import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@singleton
class Api {
  late Dio _dio;

  Api() {
    _dio = Dio()
      ..options = BaseOptions(baseUrl: "https://api.spacexdata.com/v4");
  }

  Future<Response<List<dynamic>>> getUpcomingLaunches() async =>
      await _dio.get<List<dynamic>>("/launches/upcoming");
}
