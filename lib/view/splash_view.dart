import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/color_extension.dart';
import '../view_model/splash_view_model.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final splashVM = Get.put(SplashViewModel());

  // Danh sách các màu sắc trong gradient
  List<Color> gradientColors = [
    Color.fromARGB(255, 255, 0, 0), // Màu đỏ
    Color.fromARGB(255, 0, 255, 0), // Màu xanh lá
    Color.fromARGB(255, 0, 0, 255), // Màu xanh dương
  ];

  @override
  void initState() {
    super.initState();
    splashVM.loadView();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);

    return Scaffold(
      body: TweenAnimationBuilder(
        duration: Duration(seconds: 3), // Thời gian chuyển đổi giữa các màu
        tween: ColorTween(begin: gradientColors[0], end: gradientColors[1]), 
        onEnd: () {
          setState(() {
            // Sau khi hoàn thành, thay đổi màu sắc để tạo hiệu ứng liên tục
            gradientColors = [
              Color.fromARGB(255, 255, 165, 0),  // Màu đỏ
              Color.fromARGB(255, 75, 0, 130),  // Màu cam
              Color.fromARGB(255, 0, 255, 255),  // Màu cyan
            ];
          });
        },
        builder: (BuildContext context, Color? color, Widget? child) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  color ?? gradientColors[0],
                  gradientColors[1],
                  gradientColors[2],
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: Image.asset(
                "assets/img/color_logo.png",
                width: media.width * 0.7,
              ),
            ),
          );
        },
      ),
    );
  }
}
