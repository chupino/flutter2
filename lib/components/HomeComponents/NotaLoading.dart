import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NotaLoading extends StatelessWidget {
  const NotaLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Shimmer.fromColors(
            period: const Duration(seconds: 2),
            baseColor: Colors.grey.withOpacity(0.25),
            highlightColor: Colors.white.withOpacity(0.6),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey.withOpacity(0.9)),
            )),
        Row(
          children: [
            Shimmer.fromColors(
                period: const Duration(seconds: 2),
                baseColor: Colors.grey.withOpacity(0.25),
                highlightColor: Colors.white.withOpacity(0.6),
                child: Container(
                  width: size.width * 0.4,
                  height: size.width * 0.4,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey.withOpacity(0.9)),
                )),
            Expanded(
              child: Column(
                children: [
                  Shimmer.fromColors(
                      period: const Duration(seconds: 2),
                      baseColor: Colors.grey.withOpacity(0.25),
                      highlightColor: Colors.white.withOpacity(0.6),
                      child: Container(
                        width: double.infinity,
                        height: size.width * 0.1,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.grey.withOpacity(0.9)),
                      )),
                  Shimmer.fromColors(
                      period: const Duration(seconds: 2),
                      baseColor: Colors.grey.withOpacity(0.25),
                      highlightColor: Colors.white.withOpacity(0.6),
                      child: Container(
                        width: double.infinity,
                        height: size.width * 0.1,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.grey.withOpacity(0.9)),
                      )),
                  Shimmer.fromColors(
                      period: const Duration(seconds: 2),
                      baseColor: Colors.grey.withOpacity(0.25),
                      highlightColor: Colors.white.withOpacity(0.6),
                      child: Container(
                        width: double.infinity,
                        height: size.width * 0.1,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.grey.withOpacity(0.9)),
                      )),
                ],
              ),
            )
          ],
        ),
        Row(
          children: [
            Shimmer.fromColors(
                period: const Duration(seconds: 2),
                baseColor: Colors.grey.withOpacity(0.25),
                highlightColor: Colors.white.withOpacity(0.6),
                child: Container(
                  width: size.width * 0.4,
                  height: size.width * 0.4,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey.withOpacity(0.9)),
                )),
            Expanded(
              child: Column(
                children: [
                  Shimmer.fromColors(
                      period: const Duration(seconds: 2),
                      baseColor: Colors.grey.withOpacity(0.25),
                      highlightColor: Colors.white.withOpacity(0.6),
                      child: Container(
                        width: double.infinity,
                        height: size.width * 0.1,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.grey.withOpacity(0.9)),
                      )),
                  Shimmer.fromColors(
                      period: const Duration(seconds: 2),
                      baseColor: Colors.grey.withOpacity(0.25),
                      highlightColor: Colors.white.withOpacity(0.6),
                      child: Container(
                        width: double.infinity,
                        height: size.width * 0.1,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.grey.withOpacity(0.9)),
                      )),
                  Shimmer.fromColors(
                      period: const Duration(seconds: 2),
                      baseColor: Colors.grey.withOpacity(0.25),
                      highlightColor: Colors.white.withOpacity(0.6),
                      child: Container(
                        width: double.infinity,
                        height: size.width * 0.1,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.grey.withOpacity(0.9)),
                      )),
                ],
              ),
            )
          ],
        ),
        Row(
          children: [
            Shimmer.fromColors(
                period: const Duration(seconds: 2),
                baseColor: Colors.grey.withOpacity(0.25),
                highlightColor: Colors.white.withOpacity(0.6),
                child: Container(
                  width: size.width * 0.4,
                  height: size.width * 0.4,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey.withOpacity(0.9)),
                )),
            Expanded(
              child: Column(
                children: [
                  Shimmer.fromColors(
                      period: const Duration(seconds: 2),
                      baseColor: Colors.grey.withOpacity(0.25),
                      highlightColor: Colors.white.withOpacity(0.6),
                      child: Container(
                        width: double.infinity,
                        height: size.width * 0.1,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.grey.withOpacity(0.9)),
                      )),
                  Shimmer.fromColors(
                      period: const Duration(seconds: 2),
                      baseColor: Colors.grey.withOpacity(0.25),
                      highlightColor: Colors.white.withOpacity(0.6),
                      child: Container(
                        width: double.infinity,
                        height: size.width * 0.1,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.grey.withOpacity(0.9)),
                      )),
                  Shimmer.fromColors(
                      period: const Duration(seconds: 2),
                      baseColor: Colors.grey.withOpacity(0.25),
                      highlightColor: Colors.white.withOpacity(0.6),
                      child: Container(
                        width: double.infinity,
                        height: size.width * 0.1,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.grey.withOpacity(0.9)),
                      )),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
