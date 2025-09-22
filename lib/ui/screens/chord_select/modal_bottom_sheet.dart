import 'package:c2b_chord/ui/theme/tokens.dart';
import 'package:flutter/material.dart';

/// 아래에서 올라오는 Modal Bottom Sheet.
/// Material Design을 참고함.
class ModalBottomSheet {
  static Future<void> show({
    required BuildContext context,
    required Widget child,
    bool isScrollControlled = true,
    Color? barrierColor,
    Duration animationDuration = const Duration(milliseconds: 300),
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: isScrollControlled,
      backgroundColor: barrierColor,
      builder:
          (context) => Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: C2bPadding.medium,
                horizontal: C2bPadding.largeContainer,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Handle bar
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.outline,
                      borderRadius: BorderRadius.circular(C2bRadius.full),
                    ),
                  ),
                  hGap16(),
                  child,
                ],
              ),
            ),
          ),
    );
  }
}
