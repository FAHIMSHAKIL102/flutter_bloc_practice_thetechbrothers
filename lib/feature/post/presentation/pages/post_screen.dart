import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice_thetechbrothers/core/utils/post_status.dart';
import 'package:flutter_bloc_practice_thetechbrothers/feature/post/presentation/bloc/post_bloc.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PostBloc>().add(FetchPostEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('P O S T')),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          switch (state.postStatus) {
            case PostStatus.loading:
              return Center(child: CircularProgressIndicator());
            case PostStatus.failure:
              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(state.message.toString()),
                ),
              );
            case PostStatus.success:
              return ListView.builder(
                itemCount: state.postList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text(state.postList[index].id.toString()),
                    title: Text(state.postList[index].name.toString()),
                    subtitle: Column(
                      crossAxisAlignment: .start,
                      children: [
                        Text(state.postList[index].email.toString()),
                        SizedBox(height: 10),
                        Text(state.postList[index].body.toString()),
                      ],
                    ),
                    trailing: Text(state.postList[index].postId.toString()),
                  );
                },
              );
          }
        },
      ),
    );
  }
}
