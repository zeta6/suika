import 'package:flutter/material.dart';
import 'package:suika/features/home/presentation/home_page.dart';

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
        actions: [
          if (isBackButtonVisible)
            IconButton(
              icon: const Icon(Icons.backspace_outlined),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const HomePage(),
                  ),
                );
              },
            )
        ],
      ),
      body: SafeArea(
        child: child,
      ),
    );
  }
}
