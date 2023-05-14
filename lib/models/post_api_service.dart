import 'package:chopper/chopper.dart';
part 'post_api_service.chopper.dart';

//Class for fetching json from marvel api

@ChopperApi(baseUrl: "/v1/public/comics")
abstract class PostApiService extends ChopperService {
  String title = "Hulk";

//creates get request in form of query with query map
  @Get()
  Future<Response> getComics(
    @Query() String title, {
    @QueryMap() Map<String, dynamic> query = const {
      "ts": "1",
      "apikey": "080a502746c8a60aeab043387a56eef0",
      "hash": "6edc18ab1a954d230c1f03c590d469d2",
      "limit": "25",
      "offset": "0",
      "orderBy": "onsaleDate",
    },
  });

  static PostApiService create() {
    final client = ChopperClient(
        baseUrl: Uri.parse('https://gateway.marvel.com'),
        services: [
          _$PostApiService(),
        ],
        converter: JsonConverter());
    return _$PostApiService(client);
  }
}
