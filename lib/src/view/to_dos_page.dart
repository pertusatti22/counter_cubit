import 'package:counter_cubit/src/cubit/post_fetch_cubit.dart';
import 'package:counter_cubit/src/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDosPage extends StatelessWidget {
  final String title;

  const ToDosPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: BlocBuilder<PostFetchCubit, PostFetchState>(
        builder: (context, state) {
          if (state is PostFetchLoading) {
            return const CircularProgressIndicator();
          } else if (state is PostFetchError) {
            return Text(state.failure.message);
          } else if (state is PostFetchLoaded) {
            final postList = state.postList;
            return postList.isEmpty
                ? const Text('No any posts')
                : ListView.builder(
                    itemCount: postList.length,
                    itemBuilder: (context, index) {
                      final Post singlePost = postList[index];
                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Text(singlePost.id.toString()),
                          ),
                          title: Text(singlePost.title),
                          subtitle: Text(singlePost.body),
                        ),
                      );
                    },
                  );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
