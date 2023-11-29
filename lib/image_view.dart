import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class ImageView extends StatelessWidget {
  final String? image;
  final double? progressSize;
  final double? height;
  final double? width;
  final double? borderWidth;
  final Color? borderColor;
  final BoxFit? fit;
  final String? placeholder;
  final bool isCircle;
  final double? radius;
  final double? placeholderRadius;

  const ImageView.circle(
      {Key? key,
        required this.image,
        this.progressSize,
        this.placeholder,
        this.borderWidth,
        this.borderColor,
        this.width,
        this.height,
        this.fit,
        this.isCircle = true,
        this.radius, this.placeholderRadius})
      : super(key: key);

  const ImageView.rect(
      {Key? key,
        required this.image,
        this.progressSize,
        this.placeholder,
        this.borderWidth,
        this.borderColor,
        this.width,
        this.height,
        this.fit,
        this.isCircle = false,
        this.radius, this.placeholderRadius})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
      ),
      child: !isCircle
          ? SizedBox(
        height: Get.height,
        width: Get.width,
        child: (image != null && image?.contains("http") == true)
            ? CachedNetworkImage(
          imageUrl: image!,
          imageBuilder: (context, imageProvider) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius ?? 0),
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  image: imageProvider,
                  fit: fit ?? BoxFit.fill,
                ),
              ),
            );
          },
          // placeholder: (context, url) {
          //   // return Shimmer.fromColors(
          //   //   baseColor: Colors.grey[300]!,
          //   //   highlightColor: Colors.white,
          //   //   child: Container(
          //   //     height: Get.height,
          //   //     width: Get.width,
          //   //     decoration: const BoxDecoration(
          //   //       color: Colors.grey,
          //   //     ),
          //     //),
          //  // );
          // },
          errorWidget: (context, url, error) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.red,
                  borderRadius: BorderRadius.circular(placeholderRadius??0),
                ),
            );
          },
        )
            : Container(
          // height: Get.height,
          // width: Get.width,
          // decoration: const BoxDecoration(
          //   color: Colors.white,
          //   shape: BoxShape.rectangle,
          //   image: DecorationImage(
          //       image: AssetImage(Assets.assetsBrokenImage),
          //       fit: BoxFit.cover),
          // ),
        ),
      )
          : ClipOval(
        child: SizedBox(
          height: height ?? Get.height,
          width: width ?? Get.width,
          child: (image != null && image?.contains("http") == true)
              ? CachedNetworkImage(
            imageUrl: image!,
            imageBuilder: (context, imageProvider) {
              return Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: borderColor??Colors.transparent,width: borderWidth??0),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: fit ?? BoxFit.fill,
                  ),
                ),
              );
            },

          )
              : Container(
            // height: Get.height,
            // width: Get.width,
            // decoration: const BoxDecoration(
            //   color: Colors.white,
            //   shape: BoxShape.rectangle,
            //   image: DecorationImage(
            //       image: AssetImage(Assets.assetsBrokenImage),
            //       fit: BoxFit.cover),
            // ),
          ),
        ),
      ),
    );
  }
}
