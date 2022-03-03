import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotlas_test_app/src/providers/feed_cubit/feed_cubit.dart';

import '../../providers/feed_cubit/feed_state.dart';

class ReusableRowInImgWidget extends StatelessWidget {
  final String name;
  final String subName;
  final String iconLink;
  final String? tappedIconLink;
  final String imgURL;
  final Color color;
  final String id;
  const ReusableRowInImgWidget(
      {Key? key,
      required this.iconLink,
      required this.name,
      required this.subName,
      this.tappedIconLink,
      required this.id,
      required this.imgURL,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FeedCubit _bloc = BlocProvider.of<FeedCubit>(context);
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
                image: DecorationImage(image: CachedNetworkImageProvider(imgURL)),
                color: Colors.black12,
                border: Border.all(color: color, width: 3),
                shape: BoxShape.circle),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          width: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  color: Color(0xffffffff),
                  height: 1.1111111111111112,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      color: Color(0xcc000000),
                      offset: Offset(0, 1),
                      blurRadius: 8,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                subName,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Color(0xccffffff),
                  height: 1.3333333333333333,
                  shadows: [
                    Shadow(
                      color: Color(0xff000000),
                      offset: Offset(0, 1),
                      blurRadius: 8,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        const Spacer(
          flex: 1,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: BlocBuilder<FeedCubit, FeedState>(
            buildWhen: (p, c) {
              return c is SavePost || c is UnSavePost;
            },
            bloc: _bloc,
            builder: (context, state) {
              return GestureDetector(
                onTap: () {
                  if (tappedIconLink == null) {
                    return;
                  }
                  _bloc.saveOrUnsave(id: id);
                },
                child: SvgPicture.asset(
                tappedIconLink == null ? iconLink : _bloc.savedPosts.contains(id) ? tappedIconLink! : iconLink,
                  width: 25,
                  height: 25,
                  color:   tappedIconLink == null ? Colors.white : _bloc.savedPosts.contains(id) ? Colors.amber : Colors.white,
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
