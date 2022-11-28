import 'package:bloc/bloc.dart';
import 'package:counter_cubit/src/models/failure_model.dart';
import 'package:equatable/equatable.dart';

import '../../models/post_model.dart';
import '../../repository/api_repository.dart';

part 'post_fetch_state.dart';

class PostFetchCubit extends Cubit<PostFetchState> {
  final ApiRepository apiRepository;

  PostFetchCubit({required this.apiRepository})
      : super(
          PostFetchInitial(),
        );

  Future<void> fetchPostsApi() async {
    emit(PostFetchLoading());
    try {
      final List<Post>? postList = await apiRepository.getPostList();
      emit(PostFetchLoaded(postList: postList ?? []));
    } on Failure catch (err) {
      emit(PostFetchError(failure: err));
    } catch (e) {
      print(e);
    }
  }
}
