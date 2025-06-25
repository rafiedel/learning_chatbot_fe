import 'package:flutter/material.dart';

class LearningChatbotScaffold extends StatelessWidget {
  final Widget body;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final Widget? drawer;
  final Color? backgroundColor;
  final void Function(bool)? onDrawerChanged;
  final bool resizeToAvoidBottomInset;
  final bool safeArea;
  final bool padding;

  const LearningChatbotScaffold({
    required this.body,
    this.resizeToAvoidBottomInset = false,
    this.safeArea = true,
    this.padding = true,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.drawer,
    this.backgroundColor,
    this.onDrawerChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: safeArea == true
          ? SafeArea(
              bottom: false,
              child: padding == true
                  ? Padding(
                      padding: const EdgeInsets.all(20),
                      child: body,
                    )
                  : body,
            )
          : padding == true
              ? Padding(
                  padding: const EdgeInsets.all(20),
                  child: body,
                )
              : body,
      drawer: drawer,
      onDrawerChanged: onDrawerChanged,
      backgroundColor: backgroundColor,
      bottomNavigationBar: bottomNavigationBar,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      floatingActionButton: floatingActionButton,
    );
  }
}
