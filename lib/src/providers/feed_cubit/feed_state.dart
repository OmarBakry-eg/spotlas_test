import 'package:equatable/equatable.dart';

import '../../models/feed_model.dart';

abstract class FeedState extends Equatable {
  const FeedState();

  @override
  List<Object> get props => [];
}

class FeedInitial extends FeedState {}


class FeedGettingLoading extends FeedState {}

class FeedFetchingOk extends FeedState {
  final List<FeedModel> feedModel;
  const FeedFetchingOk({required this.feedModel});
    @override
  List<Object> get props => [feedModel];
}

class FeedFetchingErr extends FeedState {}


