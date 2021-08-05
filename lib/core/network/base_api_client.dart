import 'package:http/http.dart' as http;
import 'package:resto/core/error/exceptions.dart';

class BaseApiClient {
  final http.Client client;

  final baseUrl = 'restaurant-api.dicoding.dev';

  BaseApiClient({required this.client});

  Future<String> get({required String url, Map<String, dynamic>? params, String? path}) async {
    final uri = params == null
        ? path == null
            ? Uri.https(baseUrl, url)
            : Uri.https(baseUrl, url + path)
        : path == null
            ? Uri.https(baseUrl, url, params)
            : Uri.https(baseUrl, url + path, params);

    final response = await client.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw ServerException();
    }
  }
}
