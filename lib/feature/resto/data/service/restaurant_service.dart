import 'package:resto/core/network/base_api_client.dart';

class RestaurantService {
  final BaseApiClient apiClient;

  RestaurantService({required this.apiClient});

  Future<String> getRestaurants() async {
    final url = '/list';
    return apiClient.get(url: url);
  }
}
