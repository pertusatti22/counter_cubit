import 'package:counter_cubit/src/models/post_model.dart';
import 'package:counter_cubit/src/service/api_service.dart';

class ApiRepository {
  final ApiService apiService;

  const ApiRepository({
    required this.apiService,
  });

  Future<List<Post>?> getPostList() async {
    final response = await apiService.getPostData();

    if (response != null) {
      final data = response.data as List<dynamic>;
      return data.map((singlePost) => Post.fromMap(singlePost)).toList();
    }
    return null;
  }
}
