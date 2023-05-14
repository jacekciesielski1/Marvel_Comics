// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$PostApiService extends PostApiService {
  _$PostApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = PostApiService;

  @override
  Future<Response<dynamic>> getComics(
    String title, {
    Map<String, dynamic> query = const {
      "ts": "1",
      "apikey": "080a502746c8a60aeab043387a56eef0",
      "hash": "6edc18ab1a954d230c1f03c590d469d2",
      "limit": "25",
      "offset": "0",
      "orderBy": "onsaleDate"
    },
  }) {
    final Uri $url = Uri.parse('/v1/public/comics');
    final Map<String, dynamic> $params = <String, dynamic>{'title': title};
    $params.addAll(query);
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
