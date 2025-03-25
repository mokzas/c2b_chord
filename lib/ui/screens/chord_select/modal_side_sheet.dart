import 'package:flutter/material.dart';

class ModalSideSheet {
  static Future<void> show({
    required BuildContext context,
    required Widget child,
    double width = 300,
    bool barrierDismissible = true,
    Color barrierColor = Colors.black54,
    Duration animationDuration = const Duration(milliseconds: 300),
    bool showCloseButton = true,
    String? title,
  }) {
    return showGeneralDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierLabel: 'ModalSideSheet',
      barrierColor: barrierColor,
      pageBuilder: (_, __, ___) => const SizedBox.shrink(),
      transitionBuilder: (context, animation, secondaryAnimation, _) {
        final offsetAnimation = Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: animation,
          curve: Curves.easeOut,
        ));

        return SlideTransition(
          position: offsetAnimation,
          child: Align(
            alignment: Alignment.centerRight,
            child: Material(
              elevation: 12,
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              child: SizedBox(
                width: width,
                height: double.infinity,
                child: Column(
                  children: [
                    if (title != null || showCloseButton)
                      AppBar(
                        automaticallyImplyLeading: false,  // No back button
                        title: title != null ? Text(title) : null,
                        actions: showCloseButton
                            ? [
                          IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () => Navigator.of(context).pop(),
                          )
                        ]
                            : null,
                      ),
                    Expanded(child: child),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      transitionDuration: animationDuration,
    );
  }
}