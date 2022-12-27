import 'package:flutter/material.dart';
import 'package:pt_prawathiyakarsapradipta/Style/Colors.dart';
import 'package:shimmer/shimmer.dart';

Widget shimmerCard() {
  return Padding(
    padding: const EdgeInsets.only(top: 10.0),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Shimmer.fromColors(
        baseColor: colorShimmer,
        highlightColor: Colors.white,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: colorShimmer2,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Container(
                        height: 50.0,
                        width: 250.0,
                        decoration: BoxDecoration(
                          color: colorShimmer2,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10.0),
                              topLeft: Radius.circular(10.0)),
                        ),
                      ),
                      Container(
                        height: 50.0,
                        width: 50.0,
                        color: colorShimmer2,
                      )
                    ],
                  ),
                ],
              ),
            ]),
      ),
    ),
  );
}
