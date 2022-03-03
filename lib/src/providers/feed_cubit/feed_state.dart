import 'package:equatable/equatable.dart';

import '../../models/feed_model.dart';

abstract class FeedState extends Equatable {
  const FeedState();

  @override
  List<Object> get props => [];
}

class FeedInitial extends FeedState {}

class FeedGettingLoading extends FeedState {}

class LikePost extends FeedState {
  final List<String> posts;
  const LikePost({required this.posts});
  @override
  List<Object> get props => [posts];
}

class DislikePost extends FeedState {
  final List<String> posts;
  const DislikePost({required this.posts});
  @override
  List<Object> get props => [posts];
}

class SavePost extends FeedState {
  final List<String> posts;
  const SavePost({required this.posts});
  @override
  List<Object> get props => [posts];
}

class UnSavePost extends FeedState {
  final List<String> posts;
  const UnSavePost({required this.posts});
  @override
  List<Object> get props => [posts];
}

class FeedFetchingOk extends FeedState {
  final List<FeedModel> feedModel;
  const FeedFetchingOk({required this.feedModel});
  @override
  List<Object> get props => [feedModel];
}

class FeedFetchingErr extends FeedState {}
