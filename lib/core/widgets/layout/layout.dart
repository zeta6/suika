import 'package:flutter/material.dart';

class SafeAreaLayout extends StatelessWidget {
  const SafeAreaLayout(
      {super.key,
      this.child = const SizedBox(),
      this.isBackButtonVisible = false});

  final Widget child;
  final bool isBackButtonVisible;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('suika flutter'),
      ),
      body: SafeArea(
        child: child,
      ),
    );
  }
}
