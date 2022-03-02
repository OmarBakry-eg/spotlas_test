import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:readmore/readmore.dart';
import 'package:spotlas_test_app/src/models/feed_model.dart';

import 'reusable_row_in_img_widget.dart';
import 'tags_widget.dart';

class FeedContent extends StatelessWidget {
  final FeedModel feedModel;
  const FeedContent({Key? key, required this.feedModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          height: 500,
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black12.withOpacity(0.05),
              ],
            ),
          ),
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: CachedNetworkImageProvider(feedModel.defaultPhotoUrl!))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ReusableRowInImgWidget(
                  iconLink: "assets/img/Options.svg",
                  name: feedModel.authorUsername!,
                  imgURL: feedModel.authorPhotoUrl!,
                  color: const Color(0xFFFF0040),
                  subName: feedModel.authorFullName!),
              ReusableRowInImgWidget(
                  imgURL: feedModel.placeLogoUrl ?? feedModel.authorPhotoUrl!,
                  iconLink: "assets/img/StarBorder.svg",
                  name: feedModel.placeName!,
                  color: Colors.white,
                  subName:
                      "${feedModel.placeLocationName}-${feedModel.placeLocationNameO}"),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              "assets/img/MapBorder.svg",
              width: 25,
              height: 25,
            ),
            SvgPicture.asset("assets/img/Comment.svg"),
            SvgPicture.asset(
              "assets/img/HeartBorder.svg",
              width: 25,
              height: 25,
            ),
            SvgPicture.asset("assets/img/Share.svg"),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Wrap(
            children: [
              Text(
                feedModel.authorUsername!,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff000000),
                  height: 1.3333333333333333,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              ReadMoreText(
                feedModel.description!,
                trimLength: 70,
                trimExpandedText: "less",
                trimCollapsedText: "more",
                lessStyle: const TextStyle(
                  color: Color(0xffc8c8d4),
                ),
                moreStyle: const TextStyle(
                  color: Color(0xffc8c8d4),
                ),
                style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xff000000),
                  height: 1.3333333333333333,
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        feedModel.feedModelTags == null || feedModel.feedModelTags!.isEmpty
            ? const Offstage()
            : SizedBox(
                height: 50,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  separatorBuilder: (c, i) => const SizedBox(
                    width: 10,
                  ),
                  itemBuilder: (c, i) =>
                      TagsContent(title: feedModel.feedModelTags![i].name!),
                  itemCount: feedModel.feedModelTags!.length,
                )),
        feedModel.feedModelTags == null || feedModel.feedModelTags!.isEmpty
            ? const Offstage()
            : const SizedBox(
                height: 8,
              ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '4 days ago',
              style: TextStyle(
                fontFamily: 'SFProDisplay-Medium',
                fontSize: 15,
                color: Colors.grey,
                height: 1.3333333333333333,
              ),
            ),
          ),
        )
      ],
    );
  }
}
