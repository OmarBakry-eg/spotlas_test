import 'package:bloc/bloc.dart';
import 'package:spotlas_test_app/src/res/feed_controller.dart';

import 'feed_state.dart';

class FeedCubit extends Cubit<FeedState> {
  FeedCubit() : super(FeedInitial());
  bool err = false;
  bool loading = true;
  Future<void> fetchAllFeed() async {
    err = false;
    loading = true;
    emit(FeedGettingLoading());
    final bool feed = await FeedController.getFeed();
    if (feed) {
      loading = false;
      err = false;
      emit(FeedFetchingOk(feedModel: FeedController.feedModel));
    } else {
      loading = false;
      err = true;
      emit(FeedFetchingErr());
    }
  }
}
