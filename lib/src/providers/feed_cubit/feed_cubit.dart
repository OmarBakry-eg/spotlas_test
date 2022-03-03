import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:spotlas_test_app/src/models/feed_model.dart';
import 'package:spotlas_test_app/src/res/feed_controller.dart';
import 'feed_state.dart';

class FeedCubit extends Cubit<FeedState> {
  FeedCubit() : super(FeedInitial());
  bool err = false;
  bool loading = true;
  bool loadInPagination = false;
  List<FeedModel> myFeed = [];
  int page = 1;
  List<String> likedPosts = [];
  List<String> savedPosts = [];
  final scrollController = ScrollController();
  Future<void> fetchAllFeed() async {
    await EasyLoading.show(status: 'Loading');
    err = false;
    loading = true;
    emit(FeedGettingLoading());
    final bool feed = await FeedController.getFeed(page: 1);
    await EasyLoading.dismiss();
    if (feed) {
      loading = false;
      err = false;
      myFeed.addAll(FeedController.feedModel);
      emit(FeedFetchingOk(feedModel: myFeed));
    } else {
      loading = false;
      err = true;
      emit(FeedFetchingErr());
    }
  }

  Future<void> fetchNextFeed() async {
    err = false;
    loadInPagination = true;
    page = page + 1;
    emit(FeedGettingLoading());
    final bool feed = await FeedController.getFeed(page: page);
    if (feed) {
      loadInPagination = false;
      err = false;
      myFeed.addAll(FeedController.feedModel);
      emit(FeedFetchingOk(feedModel: myFeed));
    } else {
      loadInPagination = false;
      err = true;
      emit(FeedFetchingErr());
    }
  }

  bool handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification &&
        scrollController.position.extentAfter == 0) {
      fetchNextFeed();
    }
    return false;
  }

  likeOrDislike({required String id}) {
    if (!likedPosts.contains(id)) {
      likedPosts.add(id);
      emit(LikePost(posts: likedPosts));
      emit(FeedInitial());
    } else {
      likedPosts.remove(id);
      emit(DislikePost(posts: likedPosts));
      emit(FeedInitial());
    }
  }


  saveOrUnsave({required String id}) {
    if (!savedPosts.contains(id)) {
      savedPosts.add(id);
      emit(SavePost(posts: savedPosts));
      emit(FeedInitial());
    } else {
      savedPosts.remove(id);
      emit(UnSavePost(posts: savedPosts));
      emit(FeedInitial());
    }
  }


  @override
  Future<void> close() {
    scrollController.dispose();
    return super.close();
  }
}
