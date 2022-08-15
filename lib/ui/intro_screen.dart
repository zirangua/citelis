import 'package:citelis/controllers/home_signin_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //actions: [],
        title: const Text("Welcome"),
      ),
      body: _IntroPager(),
    );
  }
}

class _IntroPager extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final homeSignInController = Get.put(HomeSignInController());
    return AbsorbPointer(
      absorbing: homeSignInController.isLoading.value,
      child: PageView(
        controller: usePageController(),
        children: [
          _LoginPage(),
        ],
      ),
    );
  }
}

class _LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeSignInController = Get.find<HomeSignInController>();
    return Container(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: const Text(
                'Sign In',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Obx(
            () => Visibility(
              visible: homeSignInController.isLoading.value,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
          Obx(
            () => Visibility(
              visible: homeSignInController.error.value?.isNotEmpty == true,
              child: Text(
                homeSignInController.error.value ?? '',
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                _LoginButton(
                  text: 'Sign in with Google',
                  imagePath: '',
                  color: Colors.white,
                  textColor: Colors.grey,
                  onTap: () => homeSignInController.signInWithGoogle(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  final String text;
  final String imagePath;
  final VoidCallback? onTap;
  final Color color;
  final Color textColor;

  const _LoginButton(
      {Key? key,
      required this.text,
      this.imagePath = '',
      this.onTap,
      this.color = Colors.blue,
      this.textColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      elevation: 4,
      borderRadius: const BorderRadius.all(
        Radius.circular(5),
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              // Image.asset(
              //   imagePath,
              //   width: 24,
              //   height: 24,
              // ),
              const SizedBox(
                width: 10,
              ),
              Text(
                text,
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
