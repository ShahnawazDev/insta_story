import 'package:insta_story/core/api_client.dart';
// import 'package:insta_story/core/dummy_user_data.dart';
import '../models/user_model.dart';

class UserRepository {
  UserRepository({required this.apiClient});

  // static const String baseUrl = 'https://ixifly.in/flutter/task2';

  final ApiClient apiClient;

  Future<List<User>> fetchUsers() async {
    final response = await apiClient.get('/flutter/task2');
    final List<dynamic> userJson = response['data'];

    // List<dynamic> userJson = dummyUserData;
    return userJson.map((json) => User.fromJson(json)).toList();
  }
}
