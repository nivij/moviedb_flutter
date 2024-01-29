import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoadingWidget extends StatelessWidget {
  final double width;
  final double height;

  const ShimmerLoadingWidget({
    Key? key,
    this.width = double.infinity,
    this.height = 330,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        color: Colors.grey.withOpacity(0.4),
        width: width,
        height: height,
      ),
    );
  }
}
