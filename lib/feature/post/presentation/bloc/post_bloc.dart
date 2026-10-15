import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_practice_thetechbrothers/core/utils/post_status.dart';
import 'package:flutter_bloc_practice_thetechbrothers/feature/post/data/model/post_model.dart';
import 'package:flutter_bloc_practice_thetechbrothers/feature/post/data/repository/post_repository_impt.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostRepositoryImpt postRepositoryImpt = PostRepositoryImpt();
  PostBloc() : super(PostState()) {
    on<FetchPostEvent>(fetchPostEvent);
  }

  FutureOr<void> fetchPostEvent(
    FetchPostEvent event,
    Emitter<PostState> emit,
  ) async {
    await postRepositoryImpt
        .fetchPost()
        .then((value) {
          emit(
            state.copyWith(
              postList: value,
              postStatus: PostStatus.success,
              message: 'success',
            ),
          );
        })
        .onError((handleError, stackTrace) async {
          print(handleError);
          print(stackTrace);
          emit(
            state.copyWith(
              postStatus: PostStatus.failure,
              message: handleError.toString(),
            ),
          );
        });
  }
}
