import 'package:bookshop/Feature/presentation/views/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:go_router/go_router.dart';

class SpalshView extends StatefulWidget {
  const SpalshView({super.key});

  @override
  State<SpalshView> createState() => _SpalshViewState();
}

class _SpalshViewState extends State<SpalshView>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingText;
  late Animation<Offset> slidingImage;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    slidingText =
        Tween<Offset>(begin: const Offset(5, 10), end: const Offset(0, 0))
            .animate(animationController);
    slidingImage =
        Tween<Offset>(begin: const Offset(-5, 10), end: const Offset(0, 0))
            .animate(animationController);
    animationController.forward();
    slidingText.addListener(() {
      setState(() {});
    });

    navigateToHome();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 3), () {
      // Get.to(() => const HomePage(),
      //     transition: Transition.rightToLeftWithFade,
      //     duration: const Duration(seconds: 2));
      GoRouter.of(context).push("/home");
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SlideTransition(
              position: slidingImage, child: Image.asset("assets/Logo.png")),
          const SizedBox(
            height: 5,
          ),
          Center(
            child: SlideTransition(
              position: slidingText,
              child: const Text(
                "Read free book",
                style: TextStyle(fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
