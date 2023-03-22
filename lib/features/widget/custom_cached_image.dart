import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:alfaisal_for_advertising/common/constants/assets.dart';
import 'package:alfaisal_for_advertising/common/extensions/screen_size_utils.dart';
import 'package:alfaisal_for_advertising/common/utils.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage(
      {Key? key,
      this.url,
      this.context,
      this.boxFit,
      this.height,
      this.width,
      this.isFlag = false})
      : super(key: key);
  final String? url;
  final double? height;
  final double? width;
  final BuildContext? context;
  final BoxFit? boxFit;
  final bool isFlag;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: CachedNetworkImage(
        imageUrl: url ?? '',
        height: height,
        width: width,
        fit: (boxFit) ?? BoxFit.contain,
        placeholder: (context, url) => Center(child: Utils.putShimmer),
        errorWidget: (context, url, error) => !isFlag
            ? Image.asset(IconsAssets.logo)
            : Icon(
                Icons.flag,
                size: 25.femW,
              ),
      ),
    );
  }
}
