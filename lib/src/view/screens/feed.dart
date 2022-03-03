import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotlas_test_app/src/providers/feed_cubit/feed_cubit.dart';

import '../../providers/feed_cubit/feed_state.dart';
import '../widgets/feed_content.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FeedCubit _bloc = BlocProvider.of<FeedCubit>(context);
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _bloc.fetchAllFeed();
    });
    return Scaffold(
      appBar: AppBar(
          shadowColor: Colors.transparent,
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: Colors.white,
          title: const Text(
            'Feed',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xff000000),
              height: 1.3333333333333333,
            ),
            textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
            textAlign: TextAlign.center,
            softWrap: false,
          )),
      body: BlocBuilder<FeedCubit, FeedState>(
        bloc: _bloc,
        builder: (context, state) {
          return _bloc.loading
              ? const Center(
                  child: Text(
                    "Loading",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontFamily: "AJannatLT",
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0),
                    maxLines: null,
                  ),
                )
              : _bloc.err
                  ? const Center(
                      child: Text(
                        "Error",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontFamily: "AJannatLT",
                            fontStyle: FontStyle.normal,
                            fontSize: 16.0),
                        maxLines: null,
                      ),
                    )
                  : NotificationListener<ScrollNotification>(
                      onNotification: _bloc.handleScrollNotification,
                      child: ListView(
                        shrinkWrap: true,
                        controller: _bloc.scrollController,
                        children: [
                          ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (c, i) => FeedContent(
                              feedModel: _bloc.myFeed[i],
                            ),
                            itemCount: _bloc.myFeed.length,
                            separatorBuilder: (c, i) => const SizedBox(
                              height: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          _bloc.loadInPagination
                              ? const SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Center(child: CircularProgressIndicator()))
                              : const Offstage(),
                        ],
                      ),
                    );
        },
      ),
    );
  }
}
