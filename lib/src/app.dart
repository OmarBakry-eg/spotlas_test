import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:spotlas_test_app/src/providers/feed_cubit/feed_cubit.dart';
import 'package:spotlas_test_app/src/view/screens/feed.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider.value(value: FeedCubit())],
      child:  MaterialApp(
        builder: EasyLoading.init(),
        home: const FeedScreen(),
      ),
    );
  }
}
