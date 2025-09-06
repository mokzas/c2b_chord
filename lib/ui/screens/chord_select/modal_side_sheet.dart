import 'package:c2b_chord/ui/theme/tokens.dart';
import 'package:flutter/material.dart';

/// 오른쪽에서 들어오는 Modal Side Sheet.
/// Material Design을 참고함.
class ModalSideSheet {
  static Future<void> show({
    required BuildContext context,
    required Widget child,
    double width = 300,
    bool barrierDismissible = true,
    required Color barrierColor,
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
        ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOut));

        return SlideTransition(
          position: offsetAnimation,
          child: Align(
            alignment: Alignment.centerRight,
            child: Material(
              elevation: 12,
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(C2bRadius.large),
                bottomLeft: Radius.circular(C2bRadius.large),
              ),
              child: SizedBox(
                width: width,
                height: double.infinity,
                child: Column(
                  children: [
                    if (title != null || showCloseButton)
                      AppBar(
                        automaticallyImplyLeading: false, // No back button
                        title: title != null ? Text(title) : null,
                        actions:
                            showCloseButton
                                ? [
                                  IconButton(
                                    icon: const Icon(Icons.close),
                                    onPressed:
                                        () => Navigator.of(context).pop(),
                                  ),
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
