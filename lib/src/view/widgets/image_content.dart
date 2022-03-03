import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../models/feed_model.dart';
import 'reusable_row_in_img_widget.dart';

class ImageContent extends StatelessWidget {
  final FeedModel feedModel;
  const ImageContent({Key? key, required this.feedModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              image: CachedNetworkImageProvider(feedModel.defaultPhotoUrl ??
                  "https://logowik.com/content/uploads/images/flutter5786.jpg"))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ReusableRowInImgWidget(
              iconLink: "assets/img/Options.svg",
              id: feedModel.id!,
              name: feedModel.authorUsername!,
              imgURL: feedModel.authorPhotoUrl!,
              color: const Color(0xFFFF0040),
              subName: feedModel.authorFullName!),
          ReusableRowInImgWidget(
              // Actually the most of placeLogoURL return 500 or 404 and that's caused laggy and performance issue
              //  imgURL: feedModel.placeLogoUrl ?? feedModel.authorPhotoUrl!,
              imgURL: feedModel.authorPhotoUrl!,
              id: feedModel.id!,
              tappedIconLink: "assets/img/Star.svg",
              iconLink: "assets/img/StarBorder.svg",
              name: feedModel.placeName!,
              color: Colors.white,
              subName: "${feedModel.placeLocationName}-${feedModel.placeLocationNameO}"),
        ],
      ),
    );
  }
}
